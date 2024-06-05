//
//  ProductItemViewModel.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 05/06/24.
//

import Foundation

// MARK: - ProducPresentationModel
struct ProductPresentationModel: Identifiable, Equatable {
  let id: Int
  let title: String
  let price: String
  let rating: String
  let thumbnailURL: URL?
  
  init(product: Product) {
    self.id = product.id
    self.title = product.title
    self.price = formatPriceToUSD(product.price)
    self.rating = String(format: "%.1f", product.rating)
    self.thumbnailURL = URL(string: product.thumbnail)
  }
}
