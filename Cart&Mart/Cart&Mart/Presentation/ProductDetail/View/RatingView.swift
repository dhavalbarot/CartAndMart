//
//  RatingView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct RatingView: View {
  
  // MARK: - PROPERTY
  var rating: Int = 0
  
  // MARK: - Initializer
  init(rating: Int) {
    self.rating = rating
  }
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .leading, spacing: 3, content: {
      Text("Rating")
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(colorGray)
      
      HStack(alignment: .center, spacing: 3, content: {
        ForEach(1...5, id: \.self) { item in
          Image(systemName: "star.fill")
            .frame(width: 28, height: 28, alignment: .center)
            .background(item <= rating ? colorAccent.cornerRadius(5) : colorGray.cornerRadius(5))
            .foregroundColor(.white)
        }
      })
    })
  }
}

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(rating: 3)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

