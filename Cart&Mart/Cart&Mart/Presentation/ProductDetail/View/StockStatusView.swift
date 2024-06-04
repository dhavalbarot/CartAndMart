//
//  StockStatusView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - StockStatusView
struct StockStatusView: View {
  
  // MARK: - PROPERTY
  let stockStatus: StockStatus
  
  // MARK: - BODY
  var body: some View {
    Button(action: {}, label: {
      Spacer()
      Text(stockStatus.rawValue)
        .font(.system(.title2))
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer()
    }) //: BUTTON
    .padding(15)
    .background(
      Color(backgroundColor(stockStatus: stockStatus))
    )
    .clipShape(Capsule())
    .accessibilityIdentifier("productDetailStockStatus")
  }
  
  private func backgroundColor(stockStatus: StockStatus) -> Color {
    switch stockStatus {
    case .outOfStock:
      colorGray
    case .lowStock:
      colorYellow
    case .inStock:
      colorAccent
    }
  }
}

// MARK: - Preview
#Preview {
  StockStatusView(stockStatus: StockStatus.inStock)
    .previewLayout(.sizeThatFits)
    .padding()
}
