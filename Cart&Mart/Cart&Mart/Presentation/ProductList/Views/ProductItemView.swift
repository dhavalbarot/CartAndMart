//
//  ProductItemView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct ProductItemView: View {
  
  // MARK: - Property
  let product: Product
  
  // MARK: - Body
  var body: some View {
    ZStack(alignment: .center, content: {
      VStack(alignment: .leading, spacing: 6, content: {
        // PHOTO
        ZStack {
          Rectangle()
            .fill(UIColor.productColor(product.id).gradient)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(12)
          AsyncImage(url: URL(string: product.thumbnail)) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxWidth: 150)
          } placeholder: {
            Image(systemName: "cart")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(maxWidth: 50)
              .font(.system(size: 30))
          }
        }
        
        // NAME
        Text(product.title)
          .font(.subheadline)
          .fontWeight(.black)
          .multilineTextAlignment(.leading)
          .frame(height: 40)
          .lineLimit(2)
        
        // PRICE
        HStack(alignment: .center, spacing: 5, content: {
          Text(product.price, format: .currency(code: "USD"))
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
          
          Spacer()
          
          Text(String(format: "%.1f", product.rating))
            .fontWeight(.semibold)
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
          Image(systemName: "star.fill")
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
  }
}

// MARK: - Preview
struct ProductItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProductItemView(product: sampleProduct)
      .previewLayout(.fixed(width: 200, height: 300))
      .background(Color.red)
  }
}

