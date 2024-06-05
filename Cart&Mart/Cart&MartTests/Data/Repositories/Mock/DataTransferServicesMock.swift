//
//  DataTransferServicesMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

// MARK: - SuccessDataTransferServicesMock
final class SuccessDataTransferServicesMock: DataTransferService {
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
    if endpoint.path.contains("products/") {
      completion(.success(ProductDetail.stub as! T))
    } else if endpoint.path.contains("products"){
      completion(.success(ProductList.stub as! T))
    } else {
      completion(.failure(.noResponse))
    }
    return nil
  }
  
  func request<E>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E : ResponseRequestable, E.Response == Void {
    completion(.success(()))
    return nil
  }
}

// MARK: - FailureDataTransferServicesMock
final class FailureDataTransferServicesMock: DataTransferService {
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
    if endpoint.path.contains("products/") {
      completion(.failure(.noResponse))
    } else if endpoint.path.contains("products"){
      completion(.failure(.noResponse))
    } else {
      completion(.failure(.noResponse))
    }
    return nil
  }
  
  func request<E>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E : ResponseRequestable, E.Response == Void {
    completion(.failure(.noResponse))
    return nil
  }
}
