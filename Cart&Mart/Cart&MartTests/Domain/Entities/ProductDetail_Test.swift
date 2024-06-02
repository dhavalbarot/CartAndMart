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
    let productList = ProductList.stub
    let url = Bundle.main.url(forResource: "products", withExtension: "json")
    let data = try? Data(contentsOf: url!)
    let decoder = JSONDecoder()
    let decodedData = try? decoder.decode(ProductList.self, from: data!)
    
    let productListObj = decodedData?.toDomain()
    
    XCTAssertEqual(productListObj, productList)
  }
  
  func test_productDetailDataToDomain() {
    let productDetail = ProductDetail.stub
    let url = Bundle.main.url(forResource: "productDetail", withExtension: "json")
    let data = try? Data(contentsOf: url!)
    let decoder = JSONDecoder()
    let decodedData = try? decoder.decode(ProductDetail.self, from: data!)
    
    let productDetailObject = decodedData?.toDomain()
    
    XCTAssertEqual(productDetailObject, productDetail)
  }
}
