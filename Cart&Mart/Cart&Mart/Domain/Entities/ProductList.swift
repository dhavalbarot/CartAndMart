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
 
 - Properties:
 - products: An array of `Product` items.
 - total: The total number of products.
 - limit: The limit of products per request.
 */
struct ProductList: Equatable, Encodable {
  let products: [Product]
  let total, limit: Int
  
  static func == (lhs: ProductList, rhs: ProductList) -> Bool {
    return lhs.products == rhs.products
  }
}

// MARK: - Product
/**
 A struct representing a product.
 
 Conforms to `Identifiable` protocols.
 
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
struct Product: Identifiable, Equatable, Encodable {
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
  
  static func == (lhs: Product, rhs: Product) -> Bool {
    return lhs.id == rhs.id
  }
}


