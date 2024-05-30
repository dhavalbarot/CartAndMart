//
//  ProductDetailImageView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct ProductDetailImageView: View {
  // MARK: - PROPERTY
  let product: ProductDetail
  
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
  var body: some View {
    HStack(alignment: .center, spacing: 6, content: {
      // PRICE
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
      
      Spacer()
      
      // PHOTO
      AsyncImage(url: URL(string: product.thumbnail), content: { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 170)
          .animation(.easeInOut(duration: 1.0), value: 2)
      }, placeholder: {})
      .frame(height: 170)
    })
    .padding(.horizontal)
    .onAppear(perform: {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    })
  }
}

// MARK: - BODY

struct ProductDetailImageView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailImageView(product: sampleProductDetail)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

