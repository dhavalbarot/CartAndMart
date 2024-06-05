//
//  ProductDetailUseCase_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class ProductDetailUseCase_Test: XCTestCase {
  var useCase: GetProductDetailUseCase!
  var mockRepository: ProductDetailRepositoryMock!
  
  override func setUp() {
    super.setUp()
    mockRepository = ProductDetailRepositoryMock()
    useCase = DefaultGetProductDetailUseCase(repository: mockRepository)
  }
  
  override func tearDown() {
    useCase = nil
    mockRepository = nil
    super.tearDown()
  }
  
  func test_getProductDetail_success() {
    // Arrange
    let expectedProductDetail = ProductDetail.stub
    mockRepository.result = .success(ProductDetail.stub)
    
    // Act
    let promise = useCase.getProductDetail(1)
    
    // Assert
    let expectation = self.expectation(description: "ProductDetail fetched successfully")
    promise.done { productDetail in
      XCTAssertEqual(productDetail, expectedProductDetail)
      expectation.fulfill()
    }.catch { error in
      XCTFail("Expected success but got error: \(error)")
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
  
  func test_getProductDetail_failure() {
    // Arrange
    let expectedError = ProductDetailRepositoryMockError.failed
    mockRepository.result = .failure(expectedError)
    
    // Act
    let promise = useCase.getProductDetail(1)
    
    // Assert
    let expectation = self.expectation(description: "ProductDetail fetch failed")
    promise.done { productDetail in
      XCTFail("Expected error but got success with product detail: \(productDetail)")
    }.catch { error in
      XCTAssertEqual(expectedError, ProductDetailRepositoryMockError.failed)
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
}
