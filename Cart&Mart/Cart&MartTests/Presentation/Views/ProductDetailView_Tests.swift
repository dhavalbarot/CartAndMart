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
    let mockUseCase = ProductDetailUseCaseMock(result: .success(testProductDetail))
    let model = DefaultProductDetailViewModel(productID: testProductDetail.id, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    
    // Act
    let productDetailLoadingView = productDetailView.getBodyItem(.loading).toVC
    
    // Assert
    assertSnapshot(of: productDetailLoadingView, as: .image(on: .iPhone13(.portrait)), named: "ProductDetailLoadingView", testName: "ProductDetailLoadingViewTest")
  }
  
  func testProductDetailDataView() {
    // Arrange
    let mockUseCase = ProductDetailUseCaseMock(result: .success(testProductDetail))
    let model = DefaultProductDetailViewModel(productID: testProductDetail.id, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    let productDetail = ProductDetailPresentationModel(productDetail: testProductDetail)
    
    // Act
    let productDetailDataView = productDetailView.productDetailContentView(productDetail).toVC
    
    // Assert
    assertSnapshot(of: productDetailDataView, as: .image(on: .iPhone13(.portrait)), named: "ProductDetailDataView", testName: "ProductDetailDataTest")
  }
  
  func testNavigationBarView() {
    // Act
    let navigationView = ProductDetailNavigationBarView().toVC
    
    // Assert
    assertSnapshot(of: navigationView, as: .image(on: .iPhone13(.portrait)), named: "ProductDetailNavigationBarView", testName: "ProductDetailNavigationBarViewTest")
  }
}
