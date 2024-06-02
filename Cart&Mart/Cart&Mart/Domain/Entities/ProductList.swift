//
//  ProductListItem.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - ProductList
struct ProductList: Codable, Equatable {
    let products: [Product]
    let total, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable, Equatable {
  let id: Int
  let title: String
  let description: String?
  let category: String?
  let brand: String?
  let price: Double
  let discountPercentage: Double?
  let rating: Double
  let stock: Int?
  let thumbnail: String
}

// MARK: - Mappings to Domain
extension ProductList {
    func toDomain() -> ProductList {
      return .init(products: products, total: total, limit: limit)
    }
}
