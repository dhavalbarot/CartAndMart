//
//  ProductListRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

protocol ProductListRepository {
    @discardableResult
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)-> Cancellable?
}
