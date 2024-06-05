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
  
  var result: Result<ProductDetail, Error>?

  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void) -> Cancellable? {
    if let result = result {
      completion(result)
    }
    return nil
  }
}
