//
//  ProductListUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

enum ProductUseCaseError: Error {
  case productListFailure
  case productDetailFailure
}

final class ProductListUseCaseMock: GetProductListUseCase {
  let result: Result<ProductList, Error>
  
  init(result: Result<ProductList, Error>) {
    self.result = result
  }
  
  func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) -> Cancellable? {
    completion(result)
    return nil
  }
}


