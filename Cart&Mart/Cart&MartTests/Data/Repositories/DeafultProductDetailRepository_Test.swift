//
//  DeafultProductDetailRepository_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

// MARK: - DeafultProductDetailRepository_Test
final class DeafultProductDetailRepository_Test: XCTestCase {
  
  func test_getProductList_success() {
    // Arrange
    var productDetailObj: ProductDetail? = nil
    let successDataTransferServices = SuccessDataTransferServicesMock()
    let repository = DefaultProductDetailRepository(dataTransferService: successDataTransferServices)
    
    // Act
    _ = repository.getProductDetail(ProductDetail.stub.id, completion: { result in
      if case let .success(productDetail) = result {
        productDetailObj = productDetail
      }
    })
    
    // Assert
    XCTAssertNotNil(productDetailObj)
  }
  
  func test_getProductList_failure() {
    // Arrange
    var dataTransferError: Error? = nil
    let failureDataTransferServices = FailureDataTransferServicesMock()
    let repository = DefaultProductDetailRepository(dataTransferService: failureDataTransferServices)
    
    // Act
    _ = repository.getProductDetail(ProductDetail.stub.id, completion: { result in
      if case let .failure(error) = result {
        dataTransferError = error
      }
    })
    
    // Assert
    XCTAssertNotNil(dataTransferError)
  }
}
