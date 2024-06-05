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
  var mockDataTransferService: DataTransferServicesMock!
  var repository: DefaultProductDetailRepository!
  
  override func setUp() {
    super.setUp()
    mockDataTransferService = DataTransferServicesMock()
    repository = DefaultProductDetailRepository(dataTransferService: mockDataTransferService)
  }
  
  override func tearDown() {
    mockDataTransferService = nil
    repository = nil
    super.tearDown()
  }
  
  func testGetProductDetailSuccess() {
    // Arrange
    let productDetail = ProductDetail.stub
    let jsonData = try! JSONEncoder().encode(productDetail)
    mockDataTransferService.result = .success(jsonData)
    
    // Act
    let promise = repository.getProductDetail(1)
    
    // Assert
    let expectation = self.expectation(description: "ProductDetail fetched successfully")
    promise.done { detail in
      XCTAssertEqual(detail, productDetail)
      expectation.fulfill()
    }.catch { error in
      XCTFail("Expected success but got error: \(error)")
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
  
  func testGetProductDetailFailure() {
    // Arrange
    let expectedError = DataTransferError.noResponse
    mockDataTransferService.result = .failure(expectedError)
    
    // Act
    let promise = repository.getProductDetail(1)
    
    // Assert
    let expectation = self.expectation(description: "ProductDetail fetch failed")
    promise.done { detail in
      XCTFail("Expected error but got success with product detail: \(detail)")
    }.catch { error in
      XCTAssertEqual(error as? DataTransferError, expectedError)
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
}
