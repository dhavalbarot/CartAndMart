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
    // Arrange
    let mockUseCase = ProductListUseCaseMock(result: .success(testProductListData))
    let model = DefaultProductListViewModel(productListUseCase: mockUseCase)
    let productListView = ProductListView(viewModel: model)
    
    // Act
    let productListLoadingView = productListView.getBodyItem(.loading).toVC
    
    // Accert
    assertSnapshot(of: productListLoadingView, as: .image(on: .iPhone13(.portrait)), named: "ProductListLoadingView", testName: "ProductListLoadingTest")
  }
  
  func testProductListDataView() {
    // Act
    let productListDataView = ProductListGridView(products: sampleProductList.products).toVC
    
    // Assert
    assertSnapshot(of: productListDataView, as: .image(on: .iPhone13(.portrait)), named: "ProductListDataView", testName: "ProductListDataTest")
  }
  
  func testErrorView() {
    // Arrange
    let contentModel = ContentModel(imageName: SystemImageName.basket, title: StringConstants.somethingWentWrong, message: StringConstants.tryAgainLater)
    
    // Act
    let errorView = ErrorContentView(contentModel: contentModel).toVC
    
    // Assert
    assertSnapshot(of: errorView, as: .image(on: .iPhone13(.portrait)), named: "ErrorContentView", testName: "ErrorContentViewTest")
  }
  
  func testNavigationBarView() {
    // Act
    let navigationView = NavigationBarView().toVC
    
    // Assert
    assertSnapshot(of: navigationView, as: .image(on: .iPhone13(.portrait)), named: "ProductListNavigationBarView", testName: "ProductListNavigationBarTest")
  }
}
