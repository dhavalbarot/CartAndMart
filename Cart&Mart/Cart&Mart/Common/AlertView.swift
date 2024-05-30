//
//  AlertView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - View
extension View {
  func showAlert(isPresented: Binding<Bool>, model: ContentModel, completion: (() -> Void)? = nil) -> some View {
    modifier(AlertModifier(isPresented: isPresented, alertContent: model, completion: completion))
  }
}

// MARK: - AlertModifier
struct AlertModifier: ViewModifier {
  @Binding var isPresented: Bool
  
  let alertContent: ContentModel
  let completion: (() -> Void)?
  
  func body(content: Content) -> some View {
    content.alert(isPresented: $isPresented) {
      Alert(title: Text(alertContent.title), message: Text(alertContent.message), dismissButton: .default(Text("Ok"), action: {
        completion?()
      }))
    }
  }
}
