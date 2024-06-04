//
//  ProductListUseCase_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class ProductListUseCase_Test: XCTestCase {

  func test_getProductList_success() {
    // Arrange
    var productList: ProductList? = nil
    let productListRepositoryMock = ProductListRepositoryMock(result: .success(ProductList.stub))
    let useCase = DefaultGetProductListUseCase(repository: productListRepositoryMock)
    
    // Act
    _ = useCase.getProductList(completion: { result in
      if case let .success(objProductList) = result {
        productList = objProductList
      }
    })
    
    // Assert
    XCTAssertNotNil(productList)
  }
  
  func test_getProductList_failure() {
    // Arrange
    var error: Error? = nil
    let productListRepositoryMock = ProductListRepositoryMock(result: .failure(ProductListRepositoryMockError.failed))
    let useCase = DefaultGetProductListUseCase(repository: productListRepositoryMock)
    
    // Act
    _ = useCase.getProductList(completion: { result in
      if case let .failure(objError) = result {
        error = objError
      }
    })
    
    // Assert
    XCTAssertNotNil(error)
  }
}
