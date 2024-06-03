//
//  Helper.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 03/06/24.
//

import SwiftUI

extension SwiftUI.View {
  var toVC: UIViewController {
    let hostingController = UIHostingController(rootView: self)
    hostingController.view.frame = UIScreen.main.bounds
    return hostingController
  }
}
