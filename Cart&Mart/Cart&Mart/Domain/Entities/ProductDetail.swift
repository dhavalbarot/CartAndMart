//
//  ProductDetail.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

enum StockStatus: String, Codable {
  case outOfStock = "Out Of Stock"
  case lowStock = "Low Stock"
  case inStock = "In Stock"
}

// MARK: - ProductDetail
struct ProductDetail: Identifiable, Codable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand, sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
  let availabilityStatus: StockStatus
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment, date, reviewerName, reviewerEmail: String
}

// MARK: - Mappings to Domain
extension ProductDetail {
    func toDomain() -> ProductDetail {
      return .init(id: id, title: title, description: description, category: category, price: price, discountPercentage: discountPercentage, rating: rating, stock: stock, tags: tags, brand: brand, sku: sku, weight: weight, warrantyInformation: warrantyInformation, shippingInformation: shippingInformation, availabilityStatus: availabilityStatus, reviews: reviews, returnPolicy: returnPolicy, minimumOrderQuantity: minimumOrderQuantity, images: images, thumbnail: thumbnail)
    }
}
