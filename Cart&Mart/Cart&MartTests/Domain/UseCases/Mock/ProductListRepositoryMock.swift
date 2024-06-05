//
//  ProductListRepositoryMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
import PromiseKit
@testable import Cart_Mart

// MARK: - ProductListRepositoryMockError
enum ProductListRepositoryMockError: Error {
    case failed
}

// MARK: - ProductListRepositoryMock
final class ProductListRepositoryMock: ProductListRepository {
  var result: Swift.Result<ProductList, Error>?
  
  func getProductList() -> Promise<ProductList> {
    return Promise<ProductList> { seal in
      guard let result = result else {
        seal.reject(ProductListRepositoryMockError.failed)
        return
      }
      switch result {
      case .success(let productList):
        seal.fulfill(productList)
      case .failure(let error):
        seal.reject(error)
      }
    }
  }
}
