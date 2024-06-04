//
//  ProductDetailViewModel_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class ProductDetailViewModel_Test: XCTestCase {
  
  func test_fetchProductListSucess() {
    // Arrange
    let expectation = XCTestExpectation()
    let productDetailUseCaseMock = ProductDetailUseCaseMock(result: .success(testProductDetail))
    let model = DefaultProductDetailViewModel(productID: defaultProductDetailId, productDetailUseCase: productDetailUseCaseMock)
    
    // Act
    model.fetchProductDetail()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.data)
    XCTAssert(model.productDetail == testProductDetail)
  }
  
  func test_fetchProductListFailure() {
    // Arrange
    let expectation = XCTestExpectation()
    let productDetailUseCaseMock = ProductDetailUseCaseMock(result: .failure(ProductUseCaseError.productDetailFailure))
    let model = DefaultProductDetailViewModel(productID: defaultProductDetailId, productDetailUseCase: productDetailUseCaseMock)

    // Act
    model.fetchProductDetail()
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.error)
  }
  
  func test_fetchProductDetailAfterDeallocation() {
    // Arrange
    let expectation = XCTestExpectation()
    let productDetailUseCaseMock = ProductDetailUseCaseMock(result: .failure(ProductUseCaseError.productDetailFailure))
    var model: DefaultProductDetailViewModel? = DefaultProductDetailViewModel(productID: defaultProductDetailId, productDetailUseCase: productDetailUseCaseMock)

    // Act
    model?.fetchProductDetail()
    model = nil
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    // Assert
    wait(for: [expectation], timeout: 2.0)
    XCTAssertNil(model?.viewContentState)
  }
}
