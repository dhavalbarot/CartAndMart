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
  let result: Result<ProductList, Error>
  
  init(result: Result<ProductList, Error>) {
    self.result = result
  }
  
  func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) -> Cancellable? {
    completion(result)
    return nil
  }
}
