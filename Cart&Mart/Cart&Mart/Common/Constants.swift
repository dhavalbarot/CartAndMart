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
let sampleProductDetail: ProductDetail = Bundle.main.decode("productDetail.json")

// MARK: - Color
let colorAccent: Color = Color.accentColor
let colorBackground: Color = Color("BackgroundColor")
let colorGray: Color = Color(UIColor.systemGray2)
let colorYellow: Color = Color("LowStockColor")

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
var threeColumn:[GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

// MARK: - UIScreen
extension UIScreen {
  static let screenWidth = UIScreen.main.bounds.size.width
  static let screenHeight = UIScreen.main.bounds.size.height
  static let screenSize = UIScreen.main.bounds.size
}

// MARK: - ViewContentState
enum ViewContentState {
  case idle
  case loading
  case data
  case error
}

// MARK: - SystemImageName
struct SystemImageName {
  static let basket = "basket"
  static let returnItem = "dollarsign.arrow.circlepath"
  static let discountTag = "tag.fill"
  static let shippingTime = "truck.box.badge.clock"
  static let warrenty = "newspaper"
  static let cart = "cart"
  static let rattingStar = "star.fill"
  static let backButton = "chevron.left"
}

// MARK: - ImageName
struct ImageName {
  static let logo = "CartAndMartLogo"
  static let andLogo = "AndLogoGreen"
}

// MARK: - String Constants
struct StringConstants {
  static let somethingWentWrong = "Something went wrong"
  static let noItem = "No item found"
  static let tryAgainLater = "Please try again later in sometime."
}
