//
//  DataTransferService.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

//MARK: - DataTransferService
protocol DataTransferService {
  typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void
  
  @discardableResult
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
  
  @discardableResult
  func request<E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void
}

//MARK: - DefaultDataTransferService
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

//MARK: - DefaultDataTransferService
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
  
  // MARK: - Private
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

//MARK: - DataTransferError
enum DataTransferError: Error {
  case noResponse
  case parsing(Error)
  case networkFailure(NetworkError)
  case resolvedNetworkFailure(Error)
}

//MARK: - DataTransferErrorResolver
protocol DataTransferErrorResolver {
  func resolve(error: NetworkError) -> Error
}

final class DefaultDataTransferErrorResolver: DataTransferErrorResolver {
  init(){}
  func resolve(error: NetworkError) -> Error {
    return error
  }
}

//MARK: -  DataTransferErrorLogger
protocol DataTransferErrorLogger {
  func log(error: Error)
}

final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {
  init(){}
  func log(error: Error) {
    printIfDebug("=============\n\(error)\n=============")
  }
}
