//
//  DeafultProductListRepository_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class DeafultProductListRepository_Test: XCTestCase {
  func test_getProductList_success() {
    var productList: ProductList? = nil
    let successDataTransferServices = SuccessDataTransferServicesMock()
    let repository = DefaultProductListRepository(dataTransferService: successDataTransferServices)
    
    _ = repository.getProductList { result in
      if case let .success(objProductList) = result {
        productList = objProductList
      }
    }
    
    XCTAssertNotNil(productList)
  }
  
  func test_getProductList_failure() {
    var dataTransferError: Error? = nil
    let failureDataTransferServices = FailureDataTransferServicesMock()
    let repository = DefaultProductListRepository(dataTransferService: failureDataTransferServices)
    
    _ = repository.getProductList { result in
      if case let .failure(error) = result {
        dataTransferError = error
      }
    }
    
    XCTAssertNotNil(dataTransferError)
  }
}
