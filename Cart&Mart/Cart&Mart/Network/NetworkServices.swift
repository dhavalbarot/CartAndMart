//
//  NetworkServices.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - NetworkCancellable
/**
 A protocol representing a cancellable network task.
 
 Conform to this protocol to define objects that can cancel network requests or tasks.
 
 - Note: Implement `cancel()` to define the cancellation behavior of the network task.
 */
protocol NetworkCancellable {
  /**
   Cancels the network task.
   
   Implement this method to cancel the ongoing network task associated with the conforming object.
   */
  func cancel()
}

// MARK: - NetworkService
/**
 A protocol defining methods for making network requests and handling responses.

 Conform to this protocol to implement networking functionality, including making requests and handling responses.

 - Note: Implement `request(endpoint:completion:)` to initiate a network request with a `Requestable` endpoint.
 */
protocol NetworkService {
  /// Defines a completion handler type for network request responses.
  typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
  
  /**
   Initiates a network request with the provided `Requestable` endpoint.
   
   - Parameter endpoint: The `Requestable` object defining details of the network request.
   - Parameter completion: A closure that receives the result of the network request: a `Result` enum containing either response data (`Data?`) or an error (`NetworkError`).
   - Returns: An object conforming to `NetworkCancellable` that can be used to cancel the request, or `nil` if cancellation is not supported.
   */
  func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}

// MARK: - DefaultNetworkService
final class DefaultNetworkService: NetworkService {
  
  private let config: NetworkConfigurable
  private let sessionManager: SessionManager
  private let logger: NetworkErrorLogger
  
  init(config: NetworkConfigurable, sessionManager: SessionManager = DefaultSessionManager(), logger: NetworkErrorLogger = DefaultNetworkErrorLogger()) {
    self.sessionManager = sessionManager
    self.config = config
    self.logger = logger
  }
  
  private func request(request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
    
    let sessionDataTask = sessionManager.request(request) { data, response, requestError in
      
      if let requestError {
        var error: NetworkError
        if let response = response as? HTTPURLResponse {
          error = .error(statusCode: response.statusCode, data: data)
        } else {
          error = self.resolve(error: requestError)
        }
        
        self.logger.log(error: error)
        completion(.failure(error))
      } else {
        self.logger.log(responseData: data, response: response)
        completion(.success(data))
      }
    }
    
    logger.log(request: request)
    
    return sessionDataTask
  }
  
  private func resolve(error: Error) -> NetworkError {
    let code = URLError.Code(rawValue: (error as NSError).code)
    
    switch code {
    case .notConnectedToInternet: return .notConnected
    case .cancelled: return .cancelled
    default: return .generic(error)
    }
  }
  
  func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable? {
    do {
      let urlRequest = try endpoint.urlRequest(with: config)
      return request(request: urlRequest, completion: completion)
    } catch {
      completion(.failure(.urlGeneration))
      return nil
    }
  }
}

