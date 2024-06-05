//
//  ProductListUseCase_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
import PromiseKit
@testable import Cart_Mart

final class ProductListUseCase_Test: XCTestCase {
  
  var useCase: GetProductListUseCase!
  var mockRepository: ProductListRepositoryMock!
  
  override func setUp() {
    super.setUp()
    mockRepository = ProductListRepositoryMock()
    useCase = DefaultGetProductListUseCase(repository: mockRepository)
  }
  
  override func tearDown() {
    useCase = nil
    mockRepository = nil
    super.tearDown()
  }
  
  func testGetProductListPromiseSuccess() {
    // Arrange
    let expectedProductList = ProductList.stub
    mockRepository.result = .success(expectedProductList)
    
    // Act
    let promise = useCase.getProductListPromise()
    
    // Assert
    let expectation = self.expectation(description: "ProductList fetched successfully")
    promise.done { productList in
      XCTAssertEqual(productList, expectedProductList)
      expectation.fulfill()
    }.catch { error in
      XCTFail("Expected success but got error: \(error)")
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
  
  func testGetProductListPromiseFailure() {
    // Arrange
    let expectedError = ProductListRepositoryMockError.failed
    mockRepository.result = .failure(expectedError)
    
    // Act
    let promise = useCase.getProductListPromise()
    
    // Assert
    let expectation = self.expectation(description: "ProductList fetch failed")
    promise.done { productList in
      XCTFail("Expected error but got success with product list: \(productList)")
    }.catch { error in
      XCTAssertEqual(expectedError, ProductListRepositoryMockError.failed)
      expectation.fulfill()
    }
    
    waitForExpectations(timeout: 1.0, handler: nil)
  }
}
