//
//  ProductListResponseDTO.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 05/06/24.
//

import Foundation

// MARK: - ProductListResponseDTO
struct ProductListResponseDTO: Decodable {
  let products: [ProductListItemDTO]
  let total, limit: Int
}

// MARK: - Mappings to Domain
extension ProductListResponseDTO {
  /**
   Converts the current instance to a `ProductList` domain model.
   
   - Returns: A `ProductList` initialized with the current instance's properties.
   */
  func toDomain() -> ProductList {
    let products = products.map({ $0.toDomain() })
    return .init(products: products, total: total, limit: limit)
  }
}

// MARK: - ProductListItemDTO
struct ProductListItemDTO: Decodable {
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
extension ProductListItemDTO {
  /**
   Converts the current instance to a `Product` domain model.
   
   - Returns: A `Product` initialized with the current instance's properties.
   */
  func toDomain() -> Product {
    return .init(id: id, title: title, description: description, category: category, brand: brand, price: price, discountPercentage: discountPercentage, rating: rating, stock: stock, thumbnail: thumbnail)
  }
}
