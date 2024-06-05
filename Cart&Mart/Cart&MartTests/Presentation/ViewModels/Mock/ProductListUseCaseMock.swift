//
//  ProductListUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
import PromiseKit
@testable import Cart_Mart

// MARK: - ProductUseCaseError
enum ProductUseCaseError: Error {
  case productListFailure
  case productDetailFailure
}

// MARK: - ProductListUseCaseMock
final class ProductListUseCaseMock: GetProductListUseCase {
  let productList: ProductList?
  let error: Error?
  
  init(productList: ProductList? = nil, error: Error? = nil) {
    self.productList = productList
    self.error = error
  }
  
  func getProductListPromise() -> PromiseKit.Promise<Cart_Mart.ProductList> {
    return Promise<ProductList> { seal in
      if let productList = productList {
        seal.fulfill(productList)
      } else {
        seal.reject(error ?? ProductUseCaseError.productListFailure)
      }
    }
  }
}
