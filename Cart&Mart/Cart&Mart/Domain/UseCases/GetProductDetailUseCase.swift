//
//  ProductDetailUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - GetProductDetailUseCase
protocol GetProductDetailUseCase {
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void) -> Cancellable?
}

// MARK: - DefaultGetProductDetailUseCase
final class DefaultGetProductDetailUseCase: GetProductDetailUseCase {
  
  // MARK: - ProductDetailRepository
  private let repository: ProductDetailRepository
  
  // MARK: - Initializer
  init(repository: ProductDetailRepository) {
    self.repository = repository
  }
  
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, any Error>) -> Void) -> (any Cancellable)? {
    return repository.getProductDetail(productID, completion: completion)
  }
}
