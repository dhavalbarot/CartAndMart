//
//  ProductListUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

// MARK: - GetProductListUseCase

/**
 A protocol defining a use case for retrieving a product list.

 Conform to this protocol to implement functionality for fetching a product list using a promise-based approach.
 */
protocol GetProductListUseCase {
  /**
   Retrieves a product list as a `Promise`.
   
   - Returns: A `Promise` object that resolves with a `ProductList` on success or an error on failure.
   */
  func getProductListPromise() -> Promise<ProductList>
}

// MARK: - DefaultGetProductListUseCase
final class DefaultGetProductListUseCase {
  
  // MARK: - ProductListRepository
  private let repository: ProductListRepository
  
  // MARK: - Initializer
  init(repository: ProductListRepository) {
    self.repository = repository
  }
}

// MARK: - GetProductListUseCase Implemention
extension DefaultGetProductListUseCase: GetProductListUseCase {
  func getProductListPromise() -> Promise<ProductList> {
    return Promise<ProductList> { seal in
      repository.getProductList { result in
        switch result {
        case .success(let productList):
          seal.fulfill(productList)
        case .failure(let error):
          seal.reject(error)
        }
      }
    }
  }
}
