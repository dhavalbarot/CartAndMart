//
//  SafeAreaSwiftUI.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

// MARK: - UIApplication
extension UIApplication {
  var keyWindow: UIWindow? {
    connectedScenes
      .compactMap {
        $0 as? UIWindowScene
      }
      .flatMap {
        $0.windows
      }
      .first {
        $0.isKeyWindow
      }
  }
}

// MARK: - SafeAreaInsetsKey
private struct SafeAreaInsetsKey: EnvironmentKey {
  static var defaultValue: EdgeInsets {
    UIApplication.shared.keyWindow?.safeAreaInsets.swiftUiInsets ?? EdgeInsets()
  }
}

// MARK: - EnvironmentValues
extension EnvironmentValues {
  var safeAreaInsets: EdgeInsets {
    self[SafeAreaInsetsKey.self]
  }
}

// MARK: - UIEdgeInsets
private extension UIEdgeInsets {
  var swiftUiInsets: EdgeInsets {
    EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
  }
}
