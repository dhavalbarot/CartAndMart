//
//  ProductDetailUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - GetProductDetailUseCase

/**
 A protocol for fetching the details of a product.

 Conform to this protocol to implement a method that fetches product details asynchronously.

 - Parameter productID: The ID of the product to fetch details for.
 - Parameter completion: A closure with `Result<ProductDetail, Error>`.
 - Returns: An optional `Cancellable` to cancel the operation.
 */
protocol GetProductDetailUseCase {
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void) -> Cancellable?
}

// MARK: - DefaultGetProductDetailUseCase
final class DefaultGetProductDetailUseCase {
  
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

// MARK: - GetProductDetailUseCase
extension DefaultGetProductDetailUseCase: GetProductDetailUseCase {
  
}
