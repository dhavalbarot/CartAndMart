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
 A protocol for fetching product list.

 Conform to this protocol to implement a method that fetches product list asynchronously.

 - Parameter completion: A closure with `Result<ProductList, Error>`.
 - Returns: An optional `Cancellable` to cancel the operation.
 */
protocol GetProductListUseCase {
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
