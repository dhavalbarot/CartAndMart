//
//  NavigationBarView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct NavigationBarView: View {
    
  // MARK: - Body
  var body: some View {
    HStack {
      Image(ImageName.logo)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 44)
        .accessibilityAddTraits(.isImage)
        .accessibilityIdentifier("CartAndMartLogo")
        .accessibilityLabel("Cart and Mart logo")
      
      Spacer()
      
      LogoView()
      
      Spacer()
      
      Image(systemName: SystemImageName.cart)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 32)
        .foregroundColor(.accentColor)
        .accessibilityAddTraits(.isButton)
        .accessibilityLabel("Cart")
        .accessibilityIdentifier("productListCartButton")
    }
    .padding(8)
    .background(Color.white)
    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
  }
}

// MARK: - PREVIEW
#Preview {
  NavigationBarView()
    .previewLayout(.sizeThatFits)
    .padding()
}
