//
//  ProductDetailRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

/**
 A protocol for retrieving the details of a product from a repository.

 Conform to this protocol to implement a method that fetches product details asynchronously.

 - Parameter productID: The ID of the product to fetch details for.
 - Parameter completion: A closure with `Result<ProductDetail, Error>`.
 - Returns: An optional `Cancellable` to cancel the operation.
 */
protocol ProductDetailRepository {
  @discardableResult
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void)-> Cancellable?
}
