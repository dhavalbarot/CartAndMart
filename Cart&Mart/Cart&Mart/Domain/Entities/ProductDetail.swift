//
//  ProductDetail.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - ProductDetail
/**
 A struct representing detailed information about a product.

 Conforms to `Identifiable` protocols.

 - Properties:
   - id: The unique identifier of the product.
   - title: The title or name of the product.
   - description: The detailed description of the product.
   - category: The category or type of the product.
   - price: The price of the product.
   - discountPercentage: The percentage of discount applied to the product.
   - rating: The rating of the product.
   - stock: The available stock quantity of the product.
   - tags: An array of tags associated with the product.
   - brand: The brand or manufacturer of the product (optional).
   - sku: The Stock Keeping Unit (SKU) of the product.
   - weight: The weight of the product in grams.
   - warrantyInformation: Information about the product's warranty.
   - shippingInformation: Information about the product's shipping details.
   - availabilityStatus: The availability status of the product (e.g., In Stock, Out of Stock).
   - returnPolicy: The return policy associated with the product.
   - minimumOrderQuantity: The minimum quantity required for ordering the product.
   - images: An array of URLs or paths to images of the product.
   - thumbnail: The URL or path to the thumbnail image of the product.
 */
struct ProductDetail: Identifiable, Equatable, Encodable {
  let id: Int
  let title: String
  let description: String
  let category: String
  let price: Double
  let discountPercentage: Double
  let rating: Double
  let stock: Int
  let tags: [String]
  let brand: String?
  let sku: String
  let weight: Int
  let warrantyInformation: String
  let shippingInformation: String
  let availabilityStatus: String
  let returnPolicy: String
  let minimumOrderQuantity: Int
  let images: [String]
  let thumbnail: String
}
