//
//  Constants.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

// MARK: - Data
let sampleResponseDTOProductList: ProductListResponseDTO = Bundle.main.decode("products.json")
let sampleResponseDTOProduct: ProductListItemDTO = sampleResponseDTOProductList.products[0]
let sampleResponseDTOProductDetail: ProductDetailResponseDTO = Bundle.main.decode("productDetail.json")

let sampleProductList: ProductList = sampleResponseDTOProductList.toDomain()
let sampleProduct: Product = sampleProductList.products[0]
let sampleProductDetail: ProductDetail = sampleResponseDTOProductDetail.toDomain()

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
enum SystemImageName: String {
  case basket = "basket"
  case returnItem = "dollarsign.arrow.circlepath"
  case discountTag = "tag.fill"
  case shippingTime = "truck.box.badge.clock"
  case warrenty = "newspaper"
  case cart = "cart"
  case rattingStar = "star.fill"
  case backButton = "chevron.left"
  
  var image: Image {
    return Image(systemName: self.rawValue)
  }
}

// MARK: - ImageName
enum CustomImageName: String {
  case logo = "CartAndMartLogo"
  case andLogo = "AndLogoGreen"
  
  var image: Image {
    return Image(self.rawValue)
  }
}

// MARK: - String Constants
struct StringConstants {
  static let somethingWentWrong = "Something went wrong"
  static let noItem = "No item found"
  static let tryAgainLater = "Please try again later in sometime."
}
