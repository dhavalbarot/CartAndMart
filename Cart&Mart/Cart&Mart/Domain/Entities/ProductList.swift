//
//  ProductListItem.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - ProductList
struct ProductList: Codable {
    let products: [Product]
    let total, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description, category, brand: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let thumbnail: String
}
