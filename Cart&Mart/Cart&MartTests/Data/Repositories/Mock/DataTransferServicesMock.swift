//
//  DataTransferServicesMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

// MARK: - DataTransferServicesMock
final class DataTransferServicesMock: DataTransferService {
  
  var result: Result<Data, DataTransferError>?
  
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T {
    guard let result = result else {
      completion(.failure(.noResponse))
      return nil
    }
    
    switch result {
    case .success(let data):
      do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(T.self, from: data)
        completion(.success(response))
      } catch {
        completion(.failure(.parsing(error)))
      }
    case .failure(let error):
      completion(.failure(error))
    }
    return nil
  }
  
  func request<E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void {
    // Handle the Void response case if necessary
    return nil
  }
}
