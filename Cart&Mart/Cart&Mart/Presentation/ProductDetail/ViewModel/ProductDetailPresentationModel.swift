//
//  ProductDetailItemViewModel.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 05/06/24.
//

import Foundation

// MARK: - StockStatus
/**
 An enumeration representing the stock status of a product.

 Conforms to `Codable` and uses `String` raw values.

 - Cases:
   - outOfStock: Indicates that the product is out of stock.
   - lowStock: Indicates that the product has low stock.
   - inStock: Indicates that the product is in stock.
 */
enum StockStatus: String {
  case outOfStock = "Out Of Stock"
  case lowStock = "Low Stock"
  case inStock = "In Stock"
}

// MARK: - ProductDetailPresentationModel
struct ProductDetailPresentationModel: Identifiable, Equatable {
  let id: Int
  let category: String
  let title: String
  let brand: String?
  let discount: String
  let price: String
  let thumbnailURL: URL?
  let description: String
  let rating: Int
  let warrantyInformation: String
  let shippingInformation: String
  let returnPolicy: String
  let stockStatus: StockStatus
  
  var stockStatusValue: String {
    return stockStatus.rawValue
  }
  
  init(productDetail: ProductDetail) {
    self.id = productDetail.id
    self.category = productDetail.category
    self.title = productDetail.title
    self.brand = productDetail.brand
    self.discount = String(format: "%.1f %%", productDetail.discountPercentage)
    self.description = productDetail.description
    self.price = formatPriceToUSD(productDetail.price)
    self.thumbnailURL = URL(string: productDetail.thumbnail)
    self.rating = Int(productDetail.rating)
    self.warrantyInformation = productDetail.warrantyInformation
    self.shippingInformation = productDetail.shippingInformation
    self.returnPolicy = productDetail.returnPolicy
    self.stockStatus = StockStatus(rawValue: productDetail.availabilityStatus) ?? .inStock
  }
}
