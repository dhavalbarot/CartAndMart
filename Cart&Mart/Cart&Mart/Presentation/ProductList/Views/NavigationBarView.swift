//
//  NavigationBarView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct NavigationBarView: View {
    
  // MARK: - Body
  var body: some View {
    HStack {
      Image("CartAndMartLogo")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 44)
      
      Spacer()
      
      LogoView()
      
      Spacer()
      
      Image(systemName: "cart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: 32)
        .foregroundColor(.accentColor)
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
