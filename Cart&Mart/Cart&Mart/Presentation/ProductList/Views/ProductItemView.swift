//
//  ProductItemView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

// MARK: - ProductItemView
struct ProductItemView: View {
  
  // MARK: - Property
  let product: ProductPresentationModel
  
  // MARK: - Body
  var body: some View {
    ZStack(alignment: .center, content: {
      VStack(alignment: .leading, spacing: 6, content: {
        // PHOTO
        ZStack {
          Rectangle()
            .fill(UIColor.productColor(product.id).gradient)
            .aspectRatio(contentMode: .fill)
          ProductImageView(imageURL: product.thumbnailURL, placeholderImage: Image(systemName: SystemImageName.cart))
        }
        .cornerRadius(12)
        
        // NAME
        Text(product.title)
          .font(.subheadline)
          .fontWeight(.black)
          .multilineTextAlignment(.leading)
          .frame(height: 40)
          .lineLimit(2)
        
        // PRICE & RATTING
        HStack(alignment: .center, spacing: 5, content: {
          Text(product.price)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
          
          Spacer()
          
          Text(product.rating)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
          Image(systemName: SystemImageName.rattingStar)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 16)
            .foregroundColor(.accentColor)
        })
        
      })
      .padding(12)
    })
    .background(Color.white)
    .cornerRadius(12)
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("Product \(product.title), price \(product.price), rating \(product.rating)")
    .accessibilityHint("Double tap to see detail")
  }
}

// MARK: - Preview
#Preview {
  ProductItemView(product: ProductPresentationModel(product: sampleProduct))
    .previewLayout(.fixed(width: 200, height: 300))
    .background(Color.red)
    .padding()
}

