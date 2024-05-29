//
//  ProductListUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - GetProductListUseCase
protocol GetProductListUseCase {
  func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) -> Cancellable?
}

// MARK: - DefaultGetProductListUseCase
final class DefaultGetProductListUseCase: GetProductListUseCase {
  
  // MARK: - ProductListRepository
  private let repository: ProductListRepository
  
  // MARK: - Initializer
  init(repository: ProductListRepository) {
    self.repository = repository
  }
  
  func getProductList(completion: @escaping (Result<ProductList, any Error>) -> Void) -> (any Cancellable)? {
    return repository.getProductList(completion: completion)
  }
}

