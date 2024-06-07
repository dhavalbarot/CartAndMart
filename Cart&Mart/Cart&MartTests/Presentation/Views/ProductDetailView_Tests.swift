//
//  ProductDetailView_Tests.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 04/06/24.
//

import XCTest
import SnapshotTesting
@testable import Cart_Mart

final class ProductDetailView_Tests: XCTestCase {
  
  func testProductDetailLoadingView() {
    // Arrange
    let mockUseCase = ProductDetailUseCaseMock()
    mockUseCase.result = .success(ProductDetail.stub)
    let model = DefaultProductDetailViewModel(productID: ProductDetail.mockProductId, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    
    // Act
    let productDetailLoadingView = productDetailView.getBodyItem(.loading).toVC
    
    // Assert
    assertSnapshot(of: productDetailLoadingView, as: .image, named: "ProductDetailLoadingView", testName: "ProductDetailLoadingViewTest")
  }
  
  func testProductDetailDataView() {
    // Arrange
    let mockUseCase = ProductDetailUseCaseMock()
    mockUseCase.result = .success(ProductDetail.stub)
    let model = DefaultProductDetailViewModel(productID: ProductDetail.mockProductId, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    let productDetail = ProductDetailPresentationModel(productDetail: ProductDetail.stub)
    
    // Act
    let productDetailDataView = productDetailView.productDetailContentView(productDetail).toVC
    
    // Assert
    assertSnapshot(of: productDetailDataView, as: .image, named: "ProductDetailDataView", testName: "ProductDetailDataTest")
  }
  
  func testNavigationBarView() {
    // Act
    let navigationView = ProductDetailNavigationBarView().toVC
    
    // Assert
    assertSnapshot(of: navigationView, as: .image, named: "ProductDetailNavigationBarView", testName: "ProductDetailNavigationBarViewTest")
  }
}
