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
        ProductAdditionalInfoView(imageName: ImageName.shippingTime, contentMessage: product.shippingInformation)
        ProductAdditionalInfoView(imageName: ImageName.warrenty, contentMessage: product.warrantyInformation)
        ProductAdditionalInfoView(imageName: ImageName.returnItem, contentMessage: product.returnPolicy)
      })
    }
  }
}

#Preview {
  ProductAdditionalInfoGroupView(product: sampleProductDetail)
}
