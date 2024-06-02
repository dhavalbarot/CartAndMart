//
//  ProductDetailUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

final class ProductDetailUseCaseMock: GetProductDetailUseCase {
  let result: Result<ProductDetail, Error>
  
  init(result: Result<ProductDetail, Error>) {
    self.result = result
  }
  
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, Error>) -> Void) -> Cancellable? {
    completion(result)
    return nil
  }
}
