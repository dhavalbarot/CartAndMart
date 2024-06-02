//
//  ProductAdditionalInfoGroupView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct ProductAdditionalInfoGroupView: View {
  // MARK: - Property
  let product: ProductDetail
  
  // MARK: - Body
  var body: some View {
    VStack {
      Divider()
      LazyVGrid(columns: threeColumn, spacing: rowSpacing, content: {
        ProductAdditionalInfoView(imageName: SystemImageName.shippingTime, contentMessage: product.shippingInformation)
        ProductAdditionalInfoView(imageName: SystemImageName.warrenty, contentMessage: product.warrantyInformation)
        ProductAdditionalInfoView(imageName: SystemImageName.returnItem, contentMessage: product.returnPolicy)
      })
    }
  }
}

#Preview {
  ProductAdditionalInfoGroupView(product: sampleProductDetail)
}
