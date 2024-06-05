//
//  ProductEndpoints.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

struct ProductEndpoints {
  static func getProductList() -> Endpoint<ProductListResponseDTO> {
    return Endpoint(path: "products", method: .get)
  }
  
  static func getProductDetail(_ productID: Int) -> Endpoint<ProductDetailResponseDTO> {
    return Endpoint(path: "products/\(productID)", method: .get)
  }
}
