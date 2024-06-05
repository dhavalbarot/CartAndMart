//
//  ProductListRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

/**
 A protocol defining a repository for retrieving product lists.

 Conform to this protocol to implement functionality for fetching a product list using a promise-based approach.
 */
protocol ProductListRepository {
  /**
   Retrieves a product list as a `Promise`.
   
   - Returns: A `Promise` object that resolves with a `ProductList` on success or an error on failure.
   */
  func getProductList() -> Promise<ProductList>
}
