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
  let product: ProductDetailPresentationModel
  
  @State private var isAnimating: Bool = false
  
  // MARK: - Body
  var body: some View {
    HStack(alignment: .center, spacing: 6, content: {
      //PRICE
      VStack(alignment: .leading, spacing: 6, content: {
        Text("Price")
          .fontWeight(.semibold)
        
        Text(product.price)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
          .minimumScaleFactor(0.4)
          .lineLimit(1)
      })
      .offset(y: isAnimating ? -50 : -75)
      .accessibilityElement(children: .ignore)
      .accessibilityAddTraits(.isStaticText)
      .accessibilityLabel(product.price)
      .accessibilityIdentifier("productDetailPriceText")
      
      Spacer()
      
      //IMAGE
      ProductImageView(imageURL: product.thumbnailURL, placeholderImage: nil)
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
  ProductDetailImageView(product: ProductDetailPresentationModel(productDetail: sampleProductDetail))
    .previewLayout(.sizeThatFits)
    .padding()
}
