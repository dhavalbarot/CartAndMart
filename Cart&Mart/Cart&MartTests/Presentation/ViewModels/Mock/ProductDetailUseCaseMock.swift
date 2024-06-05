//
//  ProductDetailUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

// MARK: - ProductDetailUseCaseMock
final class ProductDetailUseCaseMock: GetProductDetailUseCase {
  var result: Result<ProductDetail, Error>?
  
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, any Error>) -> Void) -> Cancellable? {
    if let result = result {
        completion(result)
    }
    return nil
  }
}
