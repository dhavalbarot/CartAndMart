//
//  ProductAdditionalInfoGroupView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - ProductAdditionalInfoGroupView
struct ProductAdditionalInfoGroupView: View {
  
  // MARK: - Property
  let product: ProductDetailPresentationModel
  
  // MARK: - Body
  var body: some View {
    VStack {
      Divider()
      LazyVGrid(columns: threeColumn, spacing: rowSpacing, content: {
        ProductAdditionalInfoView(imageName: SystemImageName.shippingTime.rawValue, contentMessage: product.shippingInformation)
        ProductAdditionalInfoView(imageName: SystemImageName.warrenty.rawValue, contentMessage: product.warrantyInformation)
        ProductAdditionalInfoView(imageName: SystemImageName.returnItem.rawValue, contentMessage: product.returnPolicy)
      })
    }
  }
}

// MARK: - Preview
#Preview {
  ProductAdditionalInfoGroupView(product: ProductDetailPresentationModel(productDetail: sampleProductDetail))
}
