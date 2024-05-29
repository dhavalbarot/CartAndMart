//
//  Constants.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

// MARK: - Data
let sampleProductList: ProductList = Bundle.main.decode("products.json")
let sampleProduct: Product = sampleProductList.products[0]

// MARK: - Color
let accentColor: Color = .accentColor
let backgroundColor: Color = Color("BackgroundColor")

extension UIColor {
  static func productColor(_ id: Int) -> Color {
    let number = id % 8
    let colorName = "ProductColor \(number)"
    return Color(colorName)
  }
}

// MARK: - Layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
let itemWidth = (UIScreen.screenWidth/2) - (rowSpacing * 3)
var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

// MARK: - UIScreen
extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
