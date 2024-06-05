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
  
  var viewModel: DefaultProductListViewModel!
  var productListuseCaseMock: ProductListUseCaseMock!
  
  override func setUp() {
    super.setUp()
    productListuseCaseMock = ProductListUseCaseMock()
    viewModel = DefaultProductListViewModel(productListUseCase: productListuseCaseMock)
  }
  
  override func tearDown() {
    viewModel = nil
    productListuseCaseMock = nil
    super.tearDown()
  }
  
  func testFetchProductListLoadingState() {
    // Arrange
    productListuseCaseMock.result = .success(ProductList.stub)
    
    // Act
    viewModel.fetchProductList()
    
    // Assert
    XCTAssertEqual(viewModel.viewContentState, .loading)
  }
  
  func testFetchProductListSuccess() {
    // Arrange
    let productList = ProductList.stub
    productListuseCaseMock.result = .success(productList)
    
    // Act
    viewModel.fetchProductList()
    
    // Simulate async completion
    let expectation = self.expectation(description: "Completion")
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1.0)
    
    // Assert
    XCTAssertEqual(viewModel.viewContentState, .data)
    XCTAssertEqual(viewModel.productItemList, productList.products.map { ProductPresentationModel(product: $0) })
  }
  
  func testFetchProductListFailure() {
    // Arrange
    productListuseCaseMock.result = .failure(ProductUseCaseError.productListFailure)
    
    // Act
    viewModel.fetchProductList()
    
    // Simulate async completion
    let expectation = self.expectation(description: "Completion")
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1.0)
    
    // Assert
    XCTAssertEqual(viewModel.viewContentState, .error)
  }
}
