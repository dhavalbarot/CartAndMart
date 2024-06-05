//
//  DeafultProductListRepository_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

// MARK: - DeafultProductListRepository_Test
final class DeafultProductListRepository_Test: XCTestCase {
  var mockDataTransferService: DataTransferServicesMock!
  var repository: DefaultProductListRepository!
  
  override func setUp() {
    super.setUp()
    mockDataTransferService = DataTransferServicesMock()
    repository = DefaultProductListRepository(dataTransferService: mockDataTransferService)
  }
  
  override func tearDown() {
    mockDataTransferService = nil
    repository = nil
    super.tearDown()
  }
  
  func testGetProductDetailSuccess() {
    // Arrange
    let productList = ProductList.stub
    let jsonData = try! JSONEncoder().encode(productList)
    mockDataTransferService.result = .success(jsonData)
    
    // Act
    let promise = repository.getProductList()
    
    // Assert
    let expectation = self.expectation(description: "ProductList fetched successfully")
    promise.done { detail in
      XCTAssertEqual(detail, productList)
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
    let promise = repository.getProductList()
    
    // Assert
    let expectation = self.expectation(description: "ProductList fetch failed")
    promise.done { detail in
      XCTFail("Expected error but got success with product detail: \(detail)")
    }.catch { error in
      XCTAssertEqual(error as? DataTransferError, expectedError)
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
}
