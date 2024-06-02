//
//  DiscountTagView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct DiscountTagView: View {
  
  let discount: Double
  
  var body: some View {
    HStack(spacing: 5, content: {
      Image(systemName: SystemImageName.discountTag)
        .font(.system(size: 16))
        .foregroundColor(.white)
      
      Text("\(Int(discount))%")
        .font(.system(size: 16))
        .fontWeight(.semibold)
        .foregroundColor(.white)
    })
    .padding(5)
    .background(colorAccent)
    .cornerRadius(8, corners: [.bottomLeft, .topLeft])
  }
}

// MARK: - Preview
#Preview {
  DiscountTagView(discount: 25)
    .previewLayout(.sizeThatFits)
    .padding()
}
