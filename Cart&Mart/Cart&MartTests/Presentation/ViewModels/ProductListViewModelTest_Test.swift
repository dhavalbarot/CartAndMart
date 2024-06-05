//
//  ProductListViewModelTest_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class ProductListViewModelTest_Test: XCTestCase {
  
  func test_fetchProductListSucess() {
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(productList: ProductList.stub)
    let model = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    
    model.fetchProductList()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.data)
    XCTAssert(model.productList == testProductListData.products)
  }
  
  func test_fetchProductListFailure() {
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(error: ProductUseCaseError.productListFailure)
    let model = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    
    model.fetchProductList()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    wait(for: [expectation], timeout: 2.0)
    XCTAssert(model.viewContentState == ViewContentState.error)
  }
  
  func test_fetchProductListAfterDeallocation() {
    let expectation = XCTestExpectation()
    let productListUseCaseMock = ProductListUseCaseMock(error: ProductUseCaseError.productListFailure)
    var model: DefaultProductListViewModel? = DefaultProductListViewModel(productListUseCase: productListUseCaseMock)
    
    model?.fetchProductList()
    model = nil
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      expectation.fulfill()
    })
    
    wait(for: [expectation], timeout: 2.0)
    XCTAssertNil(model?.viewContentState)
  }
}
