//
//  ProductListUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

// MARK: - ProductUseCaseError
enum ProductUseCaseError: Error {
  case productListFailure
  case productDetailFailure
}

// MARK: - ProductListUseCaseMock
final class ProductListUseCaseMock: GetProductListUseCase {
  var result: Result<ProductList, Error>?
  
  func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) -> Cancellable? {
    if let result = result {
        completion(result)
    }
    return nil
  }
}


