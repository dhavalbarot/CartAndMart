//
//  ProductListUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - GetProductListUseCase

/**
 A protocol for fetching product list.

 Conform to this protocol to implement a method that fetches product list asynchronously.

 - Parameter completion: A closure with `Result<ProductList, Error>`.
 - Returns: An optional `Cancellable` to cancel the operation.
 */
protocol GetProductListUseCase {
  func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) -> Cancellable?
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
  func getProductList(completion: @escaping (Result<ProductList, any Error>) -> Void) -> (any Cancellable)? {
    return repository.getProductList(completion: completion)
  }
}
