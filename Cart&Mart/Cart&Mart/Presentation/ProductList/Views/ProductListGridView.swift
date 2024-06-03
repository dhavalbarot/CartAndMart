//
//  ProductListGridView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 03/06/24.
//

import SwiftUI

struct ProductListGridView: View {
  
  // MARK: - Environment Property
  @EnvironmentObject private var navigationManager: NavigationManager

  // MARK: - Property
  let products: [Product]

  // MARK: - Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false, content: {
      VStack(spacing: 0) {
        LazyVGrid(columns: gridLayout, spacing: rowSpacing, content: {
          ForEach(Array(products.enumerated()), id: \.1.id) { (index, product) in
            ProductItemView(product: product)
              .onTapGesture {
                navigationManager.push(.productDetail(productID: product.id))
              }
              .accessibilityIdentifier("ProductItem_\(index)")
          }
        })
        .accessibilityIdentifier("productListGridView")
        .padding(15)
      }
    })
  }
}

// MARK: - Preview
#Preview {
  ProductListGridView(products: sampleProductList.products)
}