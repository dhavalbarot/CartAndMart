//
//  ErrorContentView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 03/06/24.
//

import SwiftUI

struct ErrorContentView: View {
  
  // MARK: - Property
  let contentModel: ContentModel
  
  // MARK: - Body
  var body: some View {
    ContentUnavailableView {
      Label(contentModel.title, systemImage: contentModel.imageName ?? "")
    } description: {
      Text(contentModel.message)
    }
  }
}

#Preview {
  let contentModel = ContentModel(imageName: SystemImageName.basket, title: StringConstants.somethingWentWrong, message: StringConstants.tryAgainLater)
  return ErrorContentView(contentModel: contentModel)
}
