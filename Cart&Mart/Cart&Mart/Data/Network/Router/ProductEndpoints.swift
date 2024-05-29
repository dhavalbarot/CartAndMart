//
//  ProductEndpoints.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

struct ProductEndpoints {
  static func getProductList() -> Endpoint<ProductListItemResponse> {
    return Endpoint(path: "products", method: .get)
  }
  
  static func getProductDetail(_ productID: Int) -> Endpoint<ProductDetailResponse> {
    return Endpoint(path: "products/\(productID)", method: .get)
  }
}
