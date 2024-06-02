//
//  ProductListStubs.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

let testProductListData: ProductList = Bundle.main.decode("products.json")
let testProductData: Product = testProductListData.products[0]

extension ProductList {
  static let stub: ProductList = {
    testProductListData
  }()
}

extension Product {
  static let stub: Product = {
    testProductData
  }()
}
