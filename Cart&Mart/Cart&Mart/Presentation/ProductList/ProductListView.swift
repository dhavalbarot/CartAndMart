//
//  ProductListView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct ProductListView: View {
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack(spacing: 0) {
          NavigationBarView()
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, geometry.safeAreaInsets.top)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
          
          ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 0) {
              LazyVGrid(columns: gridLayout, spacing: rowSpacing, content: {
                ForEach(sampleProductList.products) { product in
                  ProductItemView(product: product)
                } //: LOOP
              }) //: GRID
              .padding(15)
            } //: VSTACK
          }) //: SCROLL
        } //: VSTACK
        .background(backgroundColor.ignoresSafeArea(.all, edges: .all))
      }//: ZSTACK
      .ignoresSafeArea(.all, edges: .all)
    }
  }
}

#Preview {
    ProductListView()
}
