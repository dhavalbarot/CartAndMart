//
//  ProductDetailUseCase_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class ProductDetailUseCase_Test: XCTestCase {

  func test_getProductDetail_success() {
    // Arrange
    var productDetail: ProductDetail? = nil
    let productDetailStub = ProductDetail.stub
    let productListRepositoryMock = ProductDetailRepositoryMock(result: .success(productDetailStub))
    let useCase = DefaultGetProductDetailUseCase(repository: productListRepositoryMock)
    
    // Act
    _ = useCase.getProductDetail(ProductDetail.stub.id, completion: { result in
      if case let .success(objProductDetail) = result {
        productDetail = objProductDetail
      }
    })
    
    // Assert
    XCTAssertTrue((productDetail != nil && productDetail?.id == productDetailStub.id))
  }
  
  func test_getProductDetail_failure() {
    // Arrange
    var error: Error? = nil
    let productListRepositoryMock = ProductDetailRepositoryMock(result: .failure(ProductDetailRepositoryMockError.failed))
    let useCase = DefaultGetProductDetailUseCase(repository: productListRepositoryMock)
    
    // Act
    _ = useCase.getProductDetail(ProductDetail.stub.id, completion: { result in
      if case let .failure(objError) = result {
        error = objError
      }
    })
    
    // Assert
    XCTAssertNotNil(error)
  }
}
