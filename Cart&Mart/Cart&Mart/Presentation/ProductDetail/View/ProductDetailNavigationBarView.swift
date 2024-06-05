//
//  ProductDetailNavigationBarView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - ProductDetailNavigationBarView
struct ProductDetailNavigationBarView: View {
  
  // MARK: - PROPERTY
  @EnvironmentObject private var navigationManager: NavigationManager
  
  // MARK: - BODY
  var body: some View {
    HStack {
      Button(action: {
        withAnimation(.easeIn) {
          navigationManager.pop()
        }
      }, label: {
        Image(systemName: SystemImageName.backButton)
          .font(.title)
          .foregroundColor(.white)
      })
      .accessibilityIdentifier("productDetailBackButton")
      .accessibilityLabel("Back")
      .accessibilityHint("Double tap to see product list")
      
      Spacer()
    }
    .padding(.horizontal)
  }
}

// MARK: - PREVIEW
#Preview {
    ProductDetailNavigationBarView()
    .previewLayout(.sizeThatFits)
    .padding()
    .background(Color.gray)
}
