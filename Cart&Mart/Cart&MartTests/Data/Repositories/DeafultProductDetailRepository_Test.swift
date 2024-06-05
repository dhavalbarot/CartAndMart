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
  
  var repository: DefaultProductDetailRepository!
  var mockDataTransferService: MockDataTransferService!
  
  override func setUp() {
    super.setUp()
    mockDataTransferService = MockDataTransferService()
    repository = DefaultProductDetailRepository(dataTransferService: mockDataTransferService)
  }
  
  override func tearDown() {
    repository = nil
    mockDataTransferService = nil
    super.tearDown()
  }
  
  func testGetProductDetailsuccess() {
    // Arrange
    let productDetail = ProductDetail.stub
    let data = try! JSONEncoder().encode(productDetail)
    mockDataTransferService.result = .success(data)
    
    let expectation = self.expectation(description: "Completion")

    // Act
    let task = repository.getProductDetail(ProductDetail.mockProductId, completion: { result in
      switch result {
      case .success(let productDetail):
        XCTAssertNotNil(productDetail)
        expectation.fulfill()
      case .failure:
        XCTFail("Expected success but got failure")
      }
    })
    
    // Assert
    wait(for: [expectation], timeout: 1.0)
    XCTAssertNotNil(task)
  }
  
  func testGetProductDetailfailure() {
    // Arrange
    mockDataTransferService.result = .failure(.noResponse)

    let expectation = self.expectation(description: "Completion")

    // Act
    let task = repository.getProductDetail(ProductDetail.mockProductId) { result in
      switch result {
      case .success:
        XCTFail("Expected failure but got success")
      case .failure:
        expectation.fulfill()
      }
    }
    
    // Assert
    wait(for: [expectation], timeout: 1.0)
    XCTAssertNotNil(task)
  }
}
