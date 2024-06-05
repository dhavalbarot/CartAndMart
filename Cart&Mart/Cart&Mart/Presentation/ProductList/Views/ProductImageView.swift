//
//  ProductImageView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 02/06/24.
//

import SwiftUI

// MARK: - ProductImageView
struct ProductImageView: View {
  
  // MARK: - Properties
  let imageURL: URL?
  let placeholderImage: Image?
  
  // MARK: - Body
  var body: some View {
    AsyncImage(url: imageURL) { image in
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
    .accessibilityElement(children: .ignore)
    .accessibilityAddTraits(.isImage)
    .accessibilityIdentifier("productImage")
  }
}

// MARK: - Preview
#Preview {
  let thumbnailURL = "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png"
  return ProductImageView(imageURL: URL(string: thumbnailURL), placeholderImage: Image(systemName: SystemImageName.cart))
}
