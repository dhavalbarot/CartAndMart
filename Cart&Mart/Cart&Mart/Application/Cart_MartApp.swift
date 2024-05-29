//
//  Cart_MartApp.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

@main
struct Cart_MartApp: App {
  var body: some Scene {
    
    let appContainer = DefaultAppDIContainer()
    let productSceneContainer = DefaultProductSceneDIContainer(apiDataTransferService: appContainer.apiDataTransferService)
    
    WindowGroup {
      ProductListView(viewModel: productSceneContainer.defaultProductListViewModel)
    }
  }
}
