//
//  NetworkServices.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

//MARK: - NetworkCancellable
protocol NetworkCancellable {
  func cancel()
}

//MARK: - NetworkService
protocol NetworkService {
  typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
  
  func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}

//MARK: - DefaultNetworkService
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

