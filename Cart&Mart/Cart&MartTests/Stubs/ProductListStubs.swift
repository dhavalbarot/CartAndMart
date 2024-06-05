//
//  ProductListStubs.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
@testable import Cart_Mart

fileprivate let sampleResponseDTOProductList: ProductListResponseDTO = Bundle.main.decode("products.json")
fileprivate let sampleResponseDTOProduct: ProductListItemDTO = sampleResponseDTOProductList.products[0]

fileprivate let testProductListData: ProductList = sampleResponseDTOProductList.toDomain()
fileprivate let testProductData: Product = sampleResponseDTOProduct.toDomain()

// MARK: - ProductList
extension ProductList {
  static let stub: ProductList = {
    testProductListData
  }()
}

// MARK: - Product
extension Product {
  static let stub: Product = {
    testProductData
  }()
}

// MARK: - ProductListResponseDTO
extension ProductListResponseDTO {
  static let stub: ProductListResponseDTO = {
    sampleResponseDTOProductList
  }()
}

// MARK: - ProductListResponseDTO
extension ProductListItemDTO {
  static let stub: ProductListItemDTO = {
    sampleResponseDTOProduct
  }()
}
