//
//  ProductHeaderView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct ProductHeaderView: View {
  
  // MARK: - PROPERTY
  let product: ProductDetail
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .leading, spacing: 6, content: {
      Text(product.category)
        .font(.title3)

      Text(product.title)
        .font(.largeTitle)
        .fontWeight(.black)
        .lineLimit(2)
      
      if let brand = product.brand {
        HStack {
          Text("Brand: \(brand)")
          Spacer()
          DiscountTagView(discount: product.discountPercentage)
        }
      }
      
    })
    .foregroundColor(.white)
    .padding(.top)
  }
}

#Preview {
  ProductHeaderView(product: sampleProductDetail)
    .background(colorAccent)
}
