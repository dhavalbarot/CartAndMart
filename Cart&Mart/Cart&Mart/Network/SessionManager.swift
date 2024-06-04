//
//  SessionManager.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - URLSessionTask
extension URLSessionTask: NetworkCancellable {}

// MARK: - SessionManager
/**
 A protocol defining a session manager for making network requests.

 Conform to this protocol to implement methods for making network requests using URLSession or other networking libraries.

 - Note: Implement `request(_:completion:)` to initiate a network request with a URLRequest.

 - SeeAlso: `NetworkCancellable`
 */
protocol SessionManager {
  typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
  
  func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable
}

// MARK: - DefaultSessionManager
final class DefaultSessionManager: SessionManager {
  
  private let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
  
  func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCancellable {
    let task = session.dataTask(with: request, completionHandler: completion)
    task.resume()
    return task
  }
}
