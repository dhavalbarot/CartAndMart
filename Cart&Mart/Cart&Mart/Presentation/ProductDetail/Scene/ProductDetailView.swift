//
//  ProductDetailView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct ProductDetailView: View {
  
  let product: ProductDetail

  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {
      ProductDetailNavigationBarView()
      
      // HEADER
      ProductHeaderView(product: product)
        .padding(.leading)
      
      Spacer()
      
      ProductDetailImageView(product: product)
        .zIndex(1)
      
      // DETAIL BOTTOM PART
      VStack(alignment: .leading, spacing: 15, content: {

        HStack(alignment: .bottom, content: {
          RatingView(rating: Int(product.rating))
          Spacer()
        })
        
        Divider()
        
        Text(product.description)
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(colorGray)
      
        ProductAdditionalInfoGroupView(product: product)

        Spacer()
        
        StockStatusView(stockStatus: product.availabilityStatus)
        
      })
      .padding(.horizontal)
      .padding(.bottom)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -60)
      )
    })
    .zIndex(0)
    .background(UIColor.productColor(product.id).gradient)
    .frame(maxWidth: .infinity)
    .navigationBarBackButtonHidden()
    .edgesIgnoringSafeArea(.bottom)
  }
}

#Preview {
  ProductDetailView(product: sampleProductDetail)
}
