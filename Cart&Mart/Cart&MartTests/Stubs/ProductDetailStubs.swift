//
//  ProductDetailStubs.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

fileprivate let sampleResponseDTOProductDetail: ProductDetailResponseDTO = Bundle.main.decode("productDetail.json")
fileprivate let testProductDetail: ProductDetail = sampleResponseDTOProductDetail.toDomain()
fileprivate let defaultProductDetailId: Int  = 1

// MARK: - ProductDetail
extension ProductDetail {
  static let stub: ProductDetail = {
    testProductDetail
  }()
  
  static let mockProductId: Int = {
    defaultProductDetailId
  }()
}
