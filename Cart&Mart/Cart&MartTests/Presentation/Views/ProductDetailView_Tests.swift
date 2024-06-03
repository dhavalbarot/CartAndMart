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
    let mockUseCase = ProductDetailUseCaseMock(result: .success(testProductDetail))
    let model = DefaultProductDetailViewModel(productID: testProductDetail.id, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    let productDetailLoadingView = productDetailView.getBodyItem(.loading).toVC
    assertSnapshot(of: productDetailLoadingView, as: .image, named: "ProductDetailLoadingView", testName: "ProductDetailLoadingViewTest")
  }
  
  func testProductDetailDataView() {
    let mockUseCase = ProductDetailUseCaseMock(result: .success(testProductDetail))
    let model = DefaultProductDetailViewModel(productID: testProductDetail.id, productDetailUseCase: mockUseCase)
    let productDetailView = ProductDetailView(viewModel: model)
    let productDetailDataView = productDetailView.productDetailContentView(testProductDetail).toVC
    assertSnapshot(of: productDetailDataView, as: .image, named: "ProductDetailDataView", testName: "ProductDetailDataTest")
  }
  
  func testNavigationBarView() {
    let navigationView = ProductDetailNavigationBarView().toVC
    assertSnapshot(of: navigationView, as: .image, named: "ProductDetailNavigationBarView", testName: "ProductDetailNavigationBarViewTest")
  }
}
