//
//  ProductDetailRepositoryMock.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
import PromiseKit
@testable import Cart_Mart

// MARK: - ProductDetailRepositoryMockError
enum ProductDetailRepositoryMockError: Error {
  case failed
}

// MARK: - ProductDetailRepositoryMock
final class ProductDetailRepositoryMock: ProductDetailRepository {
  
  var result: Swift.Result<ProductDetail, Error>?
  
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail> {
    return Promise<ProductDetail> { seal in
      guard let result = result else {
        seal.reject(ProductListRepositoryMockError.failed)
        return
      }
      switch result {
      case .success(let productDetail):
        seal.fulfill(productDetail)
      case .failure(let error):
        seal.reject(error)
      }
    }
  }
}
