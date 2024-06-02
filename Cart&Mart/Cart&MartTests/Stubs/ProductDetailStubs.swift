//
//  ProductDetailStubs.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

let testProductDetail: ProductDetail = Bundle.main.decode("productDetail.json")
let defaultProductDetailId: Int  = 1

extension ProductDetail {
  static let stub: ProductDetail = {
    testProductDetail
  }()
}
