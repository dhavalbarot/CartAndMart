//
//  ProductListItem.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - ProductList
/**
 A struct representing a list of products.
 
 Conforms to `Codable` and `Equatable` protocols.
 
 - Properties:
 - products: An array of `Product` items.
 - total: The total number of products.
 - limit: The limit of products per request.
 */
struct ProductList: Codable, Equatable {
  let products: [Product]
  let total, limit: Int
}

// MARK: - Product
/**
 A struct representing a product.
 
 Conforms to `Codable`, `Identifiable`, and `Equatable` protocols.
 
 - Properties:
 - id: The unique identifier of the product.
 - title: The title or name of the product.
 - description: A brief description of the product (optional).
 - category: The category or type of the product (optional).
 - brand: The brand or manufacturer of the product (optional).
 - price: The price of the product.
 - discountPercentage: The percentage of discount applied to the product (optional).
 - rating: The rating of the product.
 - stock: The available stock quantity of the product (optional).
 - thumbnail: The URL or path to the thumbnail image of the product.
 */
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
  /**
   Converts the current instance to a `ProductList` domain model.
   
   - Returns: A `ProductList` initialized with the current instance's properties.
   */
  func toDomain() -> ProductList {
    return .init(products: products, total: total, limit: limit)
  }
}
