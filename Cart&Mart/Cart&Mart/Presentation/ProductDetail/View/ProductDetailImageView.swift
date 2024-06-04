//
//  ProductDetailImageView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - ProductDetailImageView
struct ProductDetailImageView: View {
  
  // MARK: - Property
  let product: ProductDetail
  
  @State private var isAnimating: Bool = false
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 6, content: {
      //PRICE
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Price")
          .fontWeight(.semibold)
        
        Text(product.price, format: .currency(code: "USD"))
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
          .minimumScaleFactor(0.4)
          .lineLimit(1)
      })
      .offset(y: isAnimating ? -50 : -75)
      .accessibilityElement(children: .ignore)
      .accessibilityAddTraits(.isStaticText)
      .accessibilityLabel(Text(product.price, format: .currency(code: "USD")))
      .accessibilityIdentifier("productDetailPriceText")
      
      Spacer()
      
      //IMAGE
      ProductImageView(imageURL: product.thumbnail, placeholderImage: nil)
    })
    .padding(.horizontal)
    .onAppear(perform: {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    })
  }
}

// MARK: - Preview
#Preview {
  ProductDetailImageView(product: sampleProductDetail)
    .previewLayout(.sizeThatFits)
    .padding()
}
