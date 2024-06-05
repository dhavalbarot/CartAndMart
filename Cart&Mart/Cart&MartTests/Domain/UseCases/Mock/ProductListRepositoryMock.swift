//
//  ProductListRepositoryMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

enum ProductListRepositoryMockError: Error {
    case failed
}

final class ProductListRepositoryMock: ProductListRepository {
  
  var result: Result<ProductList, Error>?
  
  func getProductList(completion: @escaping (Result<ProductList, any Error>) -> Void) -> (any Cancellable)? {
    if let result = result {
      completion(result)
    }
    return nil
  }
}
