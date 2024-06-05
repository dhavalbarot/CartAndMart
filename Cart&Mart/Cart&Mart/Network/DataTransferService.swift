//
//  DataTransferService.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - DataTransferService
/**
 A protocol defining methods for making data transfer requests and handling responses.

 Conform to this protocol to implement functionality for making data transfer requests and handling responses.

 - Note: Implement `request(with:completion:)` methods to initiate network requests with endpoints conforming to `ResponseRequestable`.
 */
protocol DataTransferService {
  /// Defines a completion handler type for data transfer request responses.
  typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void
  
  /**
   Initiates a data transfer request with the provided endpoint.
   
   - Parameter endpoint: The endpoint conforming to `ResponseRequestable`, defining details of the data transfer request.
   - Parameter completion: A closure that receives the result of the data transfer request: a `Result` enum containing either the expected response type `T` or an error (`DataTransferError`).
   - Returns: An object conforming to `NetworkCancellable` that can be used to cancel the request, or `nil` if cancellation is not supported.
   - Throws: An error if decoding the response fails, such as `DecodingError.dataCorrupted` or `DecodingError.typeMismatch`.
   */
  @discardableResult
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
  
  /**
   Initiates a data transfer request with the provided endpoint, expecting no response.
   
   - Parameter endpoint: The endpoint conforming to `ResponseRequestable`, defining details of the data transfer request.
   - Parameter completion: A closure that receives the result of the data transfer request: a `Result` enum containing either `Void` or an error (`DataTransferError`).
   - Returns: An object conforming to `NetworkCancellable` that can be used to cancel the request, or `nil` if cancellation is not supported.
   */
  @discardableResult
  func request<E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void
}

// MARK: - DefaultDataTransferService
final class DefaultDataTransferService {
  
  private let networkService: NetworkService
  private let errorResolver: DataTransferErrorResolver
  private let errorLogger: DataTransferErrorLogger
  
  init(with networkService: NetworkService, errorResolver: DataTransferErrorResolver = DefaultDataTransferErrorResolver(), errorLogger: DataTransferErrorLogger = DefaultDataTransferErrorLogger()) {
    self.networkService = networkService
    self.errorResolver = errorResolver
    self.errorLogger = errorLogger
  }
}

// MARK: - DataTransferService Implementation
extension DefaultDataTransferService: DataTransferService {
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
    networkService.request(endpoint: endpoint) { result in
      switch result {
      case .success(let data):
        let result: Result<T, DataTransferError> = self.decode(data: data, decoder: endpoint.responseDecoder)
        completion(result)
      case .failure(let error):
        self.errorLogger.log(error: error)
        let error = self.resolve(networkError: error)
        completion(.failure(error))
      }
    }
  }
  
  func request<E>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E : ResponseRequestable, E.Response == Void {
    networkService.request(endpoint: endpoint) { result in
      switch result {
      case .success:
        completion(.success(()))
      case .failure(let error):
        self.errorLogger.log(error: error)
        let error = self.resolve(networkError: error)
        completion(.failure(error))
      }
    }
  }
  
  // MARK: - Private Functions
  private func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTransferError> {
    do {
      guard let data = data else { return .failure(.noResponse) }
      let result: T = try decoder.decode(data)
      return .success(result)
    } catch {
      self.errorLogger.log(error: error)
      return .failure(.parsing(error))
    }
  }
  
  private func resolve(networkError error: NetworkError) -> DataTransferError {
    let resolvedError = self.errorResolver.resolve(error: error)
    return resolvedError is NetworkError ? .networkFailure(error) : .resolvedNetworkFailure(resolvedError)
  }
}

// MARK: - DataTransferError
/**
 An enumeration representing possible errors that may occur during data transfer operations.

 Conform to this enum to handle different types of errors encountered while making data transfer requests and processing responses.

 - Cases:
   - noResponse: Indicates that no response was received from the server.
   - parsing(Error): Indicates an error occurred while parsing or decoding the response data.
   - networkFailure(NetworkError): Indicates a failure in the network layer, represented by a `NetworkError`.
   - resolvedNetworkFailure(Error): Indicates a failure that was resolved but resulted in an associated error.
 */
enum DataTransferError: Error, Equatable {
  case noResponse
  case parsing(Error)
  case networkFailure(NetworkError)
  case resolvedNetworkFailure(Error)
  
  static func ==(lhs: DataTransferError, rhs: DataTransferError) -> Bool {
      switch (lhs, rhs) {
      case (.noResponse, .noResponse):
          return true
      case (.parsing(let lhsError), .parsing(let rhsError)):
          return lhsError.localizedDescription == rhsError.localizedDescription
      case (.networkFailure(let lhsError), .networkFailure(let rhsError)):
          return true
      case (.resolvedNetworkFailure(let lhsError), .resolvedNetworkFailure(let rhsError)):
          return lhsError.localizedDescription == rhsError.localizedDescription
      default:
          return false
      }
  }

}

// MARK: - DataTransferErrorResolver
/**
 A protocol defining a method for resolving `NetworkError` instances into `Error` instances.

 Conform to this protocol to provide custom implementations for resolving network errors into generic `Error` instances.

 - Note: Implement `resolve(error:)` to define how specific `NetworkError` instances are resolved into generic `Error` instances.
 */
protocol DataTransferErrorResolver {
  /**
   Resolves the provided `NetworkError` instance into a generic `Error`.
   
   - Parameter error: The `NetworkError` instance to resolve.
   - Returns: An `Error` instance representing the resolved error.
   */
  func resolve(error: NetworkError) -> Error
}

final class DefaultDataTransferErrorResolver: DataTransferErrorResolver {
  init(){}
  func resolve(error: NetworkError) -> Error {
    return error
  }
}

// MARK: -  DataTransferErrorLogger
/**
 A protocol defining a method for logging errors during data transfer operations.

 Conform to this protocol to implement custom error logging behaviors for data transfer errors.

 - Note: Implement `log(error:)` to define how errors encountered during data transfer operations are logged.
 */
protocol DataTransferErrorLogger {
  /**
   Logs the provided error encountered during data transfer operations.
   
   - Parameter error: The `Error` instance to be logged.
   */
  func log(error: Error)
}

// MARK: - DefaultDataTransferErrorLogger
final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {
  init(){}
  func log(error: Error) {
    printIfDebug("=============\n\(error)\n=============")
  }
}
