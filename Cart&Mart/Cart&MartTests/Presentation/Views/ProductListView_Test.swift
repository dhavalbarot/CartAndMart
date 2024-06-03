//
//  ProductListView_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 03/06/24.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import Cart_Mart

final class ProductListView_Test: XCTestCase {

  func testProductListLoadingView() {
    let mockUseCase = ProductListUseCaseMock(result: .success(testProductListData))
    let model = DefaultProductListViewModel(productListUseCase: mockUseCase)
    let productListView = ProductListView(viewModel: model)
    let productListLoadingView = productListView.getBodyItem(.loading).toVC
    assertSnapshot(of: productListLoadingView, as: .image, named: "ProductListLoadingView", testName: "ProductListLoadingTest")
  }
  
  func testProductListDataView() {
    let productListDataView = ProductListGridView(products: sampleProductList.products).toVC
    assertSnapshot(of: productListDataView, as: .image, named: "ProductListDataView", testName: "ProductListDataTest")
  }
  
  func testErrorView() {
    let contentModel = ContentModel(imageName: SystemImageName.basket, title: StringConstants.somethingWentWrong, message: StringConstants.tryAgainLater)
    let errorView = ErrorContentView(contentModel: contentModel).toVC
    assertSnapshot(of: errorView, as: .image, named: "ErrorContentView", testName: "ErrorContentViewTest")
  }
  
  func testNavigationBarView() {
    let navigationView = NavigationBarView().toVC
    assertSnapshot(of: navigationView, as: .image, named: "ProductListNavigationBarView", testName: "ProductListNavigationBarTest")
  }
}
