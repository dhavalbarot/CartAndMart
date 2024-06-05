//
//  ProductDetailViewModel_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

// MARK: - ProductDetailViewModel_Test
final class ProductDetailViewModel_Test: XCTestCase {
  
  var viewModel: DefaultProductDetailViewModel!
  var productDetailUseCaseMock: ProductDetailUseCaseMock!
  
  override func setUp() {
    super.setUp()
    productDetailUseCaseMock = ProductDetailUseCaseMock()
    viewModel = DefaultProductDetailViewModel(productID: ProductDetail.mockProductId, productDetailUseCase: productDetailUseCaseMock)
  }
  
  override func tearDown() {
    viewModel = nil
    productDetailUseCaseMock = nil
    super.tearDown()
  }
  
  func testFetchProductDetailLoadingState() {
    // Arrange
    productDetailUseCaseMock.result = .success(ProductDetail.stub)
    
    // Act
    viewModel.fetchProductDetail()
    
    // Assert
    XCTAssertEqual(viewModel.viewContentState, .loading)
  }
  
  func testFetchProductDetailSuccess() {
    // Arrange
    let productDetail = ProductDetail.stub
    productDetailUseCaseMock.result = .success(productDetail)
    
    // Act
    viewModel.fetchProductDetail()
    
    // Simulate async completion
    let expectation = self.expectation(description: "Completion")
    DispatchQueue.main.async {
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 1.0)
    
    // Assert
    XCTAssertEqual(viewModel.viewContentState, .data)
    XCTAssertEqual(viewModel.productDetail, ProductDetailPresentationModel(productDetail: productDetail))
  }
  
  func testFetchProductDetailFailure() {
    // Arrange
    productDetailUseCaseMock.result = .failure(ProductUseCaseError.productDetailFailure)
    
    // Act
    viewModel.fetchProductDetail()
    
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
