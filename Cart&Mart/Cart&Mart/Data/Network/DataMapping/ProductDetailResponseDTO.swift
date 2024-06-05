//
//  ProductDetailResponseDTO.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 05/06/24.
//

import Foundation

struct ProductDetailResponseDTO: Decodable{
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


// MARK: - Mappings to Domain
extension ProductDetailResponseDTO {
  /**
   Converts the current instance to a `ProductDetail` domain model.
   
   - Returns: A `ProductDetail` initialized with the current instance's properties.
   */
  func toDomain() -> ProductDetail {
    return .init(id: id, title: title, description: description, category: category, price: price, discountPercentage: discountPercentage, rating: rating, stock: stock, tags: tags, brand: brand, sku: sku, weight: weight, warrantyInformation: warrantyInformation, shippingInformation: shippingInformation, availabilityStatus: availabilityStatus, returnPolicy: returnPolicy, minimumOrderQuantity: minimumOrderQuantity, images: images, thumbnail: thumbnail)
  }
}
