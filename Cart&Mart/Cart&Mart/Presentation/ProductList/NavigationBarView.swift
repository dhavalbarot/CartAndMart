//
//  NavigationBarView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct NavigationBarView: View {
  
  // MARK: - Property
  @State private var isAnimated: Bool = false
  
  // MARK: - Body
  var body: some View {
    HStack {
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -25)
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
    }
  }
}

// MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
