//
//  ProductDetail_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class Entity_Test: XCTestCase {

  func test_productListDataToDomain() {
    // Arrange
    let productList = ProductList.stub
    let url = Bundle.main.url(forResource: "products", withExtension: "json")
    let data = try? Data(contentsOf: url!)
    let decoder = JSONDecoder()
    let decodedData = try? decoder.decode(ProductListResponseDTO.self, from: data!)
    
    // Act
    let productListObj = decodedData?.toDomain()
    
    // Assert
    XCTAssertEqual(productListObj, productList)
  }
  
  func test_productDetailDataToDomain() {
    // Arrange
    let productDetail = ProductDetail.stub
    let url = Bundle.main.url(forResource: "productDetail", withExtension: "json")
    let data = try? Data(contentsOf: url!)
    let decoder = JSONDecoder()
    let decodedData = try? decoder.decode(ProductDetailResponseDTO.self, from: data!)
    
    // Act
    let productDetailObject = decodedData?.toDomain()
    
    // Assert
    XCTAssertEqual(productDetailObject, productDetail)
  }
}
