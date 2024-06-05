//
//  ProductListViewModelTest_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

// MARK: - ProductListViewModelTest_Test
final class ProductListViewModelTest_Test: XCTestCase {
  
  func test_fetchProductListSucess() {
    // Arrange
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(result: .success(testProductListData))
    let model = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    let expectedProductList = testProductListData.products.map({ ProductPresentationModel(product: $0)})
    
    // Act
    model.fetchProductList()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.data)
    XCTAssert(model.productItemList == expectedProductList)
  }
  
  func test_fetchProductListFailure() {
    // Arrange
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(result: .failure(ProductUseCaseError.productListFailure))
    let model = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    
    // Act
    model.fetchProductList()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.error)
  }
  
  func test_fetchProductListAfterDeallocation() {
    // Arrange
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(result: .failure(ProductUseCaseError.productListFailure))
    var model: DefaultProductListViewModel? = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    
    // Act
    model?.fetchProductList()
    model = nil
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssertNil(model?.viewContentState)
  }
}
