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
  
  var repository: DefaultProductListRepository!
  var mockDataTransferService: MockDataTransferService!
  
  override func setUp() {
    super.setUp()
    mockDataTransferService = MockDataTransferService()
    repository = DefaultProductListRepository(dataTransferService: mockDataTransferService)
  }
  
  override func tearDown() {
    repository = nil
    mockDataTransferService = nil
    super.tearDown()
  }
  
  func testGetProductListSuccess() {
    // Arrange
    let productDTO = ProductList.stub
    let data = try! JSONEncoder().encode(productDTO)
    mockDataTransferService.result = .success(data)

    let expectation = self.expectation(description: "Completion")
    
    // Act
    let task = repository.getProductList { result in
      switch result {
      case .success(let productList):
        XCTAssertNotNil(productList)
        expectation.fulfill()
      case .failure:
        XCTFail("Expected success but got failure")
      }
    }
    
    // Assert
    wait(for: [expectation], timeout: 1.0)
    XCTAssertNotNil(task)
  }
  
  func testGetProductListFailure() {
    // Arrange
    mockDataTransferService.result = .failure(.noResponse)
    
    let expectation = self.expectation(description: "Completion")
    
    // Act
    let task = repository.getProductList { result in
      switch result {
      case .success:
        XCTFail("Expected failure but got success")
      case .failure(let receivedError):
        expectation.fulfill()
      }
    }
    
    // Assert
    wait(for: [expectation], timeout: 1.0)
    XCTAssertNotNil(task)
  }
}
