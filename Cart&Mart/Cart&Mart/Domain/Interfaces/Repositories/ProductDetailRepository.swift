//
//  ProductDetailRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

/**
 A protocol defining a repository for retrieving product details.

 Conform to this protocol to implement functionality for fetching product details using a promise-based approach.
*/
protocol ProductDetailRepository {
  /**
   Retrieves the details of a specific product by its ID as a `Promise`.
   
   - Parameter productID: The unique identifier of the product whose details are to be fetched.
   - Returns: A `Promise` object that resolves with a `ProductDetail` on success or an error on failure.
   */
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail>
}
