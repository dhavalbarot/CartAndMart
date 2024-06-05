//
//  ProductDetailUseCase.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

// MARK: - GetProductDetailUseCase

/**
 A protocol defining a use case for retrieving product details.

 Conform to this protocol to implement functionality for fetching product details using a promise-based approach.
 */
protocol GetProductDetailUseCase {
  /**
   Retrieves the details of a specific product by its ID as a `Promise`.
   
   - Parameter productID: The unique identifier of the product whose details are to be fetched.
   - Returns: A `Promise` object that resolves with a `ProductDetail` on success or an error on failure.
   */
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail>
}

// MARK: - DefaultGetProductDetailUseCase
final class DefaultGetProductDetailUseCase {
  
  // MARK: - ProductDetailRepository
  private let repository: ProductDetailRepository
  
  // MARK: - Initializer
  init(repository: ProductDetailRepository) {
    self.repository = repository
  }
}

// MARK: - GetProductDetailUseCase
extension DefaultGetProductDetailUseCase: GetProductDetailUseCase {
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail> {
    return Promise<ProductDetail> { seal in
      repository.getProductDetail(productID) { result in
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
