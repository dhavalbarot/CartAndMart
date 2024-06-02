//
//  ProductImageView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 02/06/24.
//

import SwiftUI

struct ProductImageView: View {
  
  let imageURL: String
  let placeholderImage: Image?
  
  var body: some View {
    AsyncImage(url: URL(string: imageURL)) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 150)
    } placeholder: {
      placeholderImage?
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 50)
        .font(.system(size: 30))
    }
  }
}

#Preview {
  let thumbnailURL = "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png"
  return ProductImageView(imageURL: thumbnailURL, placeholderImage: Image(systemName: SystemImageName.cart))
}
