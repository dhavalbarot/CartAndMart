//
//  ProductHeaderView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - ProductHeaderView
struct ProductHeaderView: View {
  
  // MARK: - PROPERTY
  let product: ProductDetailPresentationModel
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .leading, spacing: 6, content: {
      Text(product.category)
        .font(.title3)
        .accessibilityLabel("Category \(product.category)")
        .accessibilityIdentifier("productDetailCategoryText")

      Text(product.title)
        .font(.largeTitle)
        .fontWeight(.black)
        .lineLimit(2)
        .accessibilityLabel("Product \(product.title)")
        .accessibilityIdentifier("productDetailTitleText")

      if let brand = product.brand {
        HStack {
          Text("Brand: \(brand)")
            .accessibilityLabel("Brand: \(brand)")
            .accessibilityIdentifier("productDetailBrandText")

          Spacer()
          
          DiscountTagView(discount: product.discount)
        }
      }
      
    })
    .foregroundColor(.white)
    .padding(.top)
  }
}

// MARK: - Preview
#Preview {
  ProductHeaderView(product: ProductDetailPresentationModel(productDetail: sampleProductDetail))
    .background(colorAccent)
}
