//
//  CustomShape.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - CustomShape
struct CustomShape: Shape {
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
    
    return Path(path.cgPath)
  }
}

// MARK: - Preview
#Preview {
  CustomShape()
    .previewLayout(.fixed(width: 428, height: 120))
    .padding()
}
