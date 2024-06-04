//
//  ProductListRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

/**
 A protocol for retrieving a list of products from a repository.

 Conform to this protocol to implement a method that fetches product lists asynchronously.

 - Parameter completion: A closure with `Result<ProductList, Error>`.
 - Returns: An optional `Cancellable` to cancel the operation.
 */
protocol ProductListRepository {
    @discardableResult
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)-> Cancellable?
}
