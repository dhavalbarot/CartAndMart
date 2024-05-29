//
//  ProductDetailRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

protocol ProductDetailRepository {
  @discardableResult
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void)-> Cancellable?
}
