//
//  ProductDetailRepositoryMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

enum ProductDetailRepositoryMockError: Error {
  case failed
}

final class ProductDetailRepositoryMock: ProductDetailRepository {
  
  let result: Result<ProductDetail, Error>
  
  init(result: Result<ProductDetail, Error>) {
    self.result = result
  }
  
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void) -> Cancellable? {
    switch result {
    case .success(let detail):
      if detail.id == productID {
        completion(.success(detail))
      } else {
        completion(.success(sampleProductDetail))
      }
    case .failure(let error):
      completion(.failure(error))
    }
    return nil
  }
}
