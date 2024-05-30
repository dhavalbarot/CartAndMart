//
//  NavigationView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - NavigationView
struct NavigationView: View {
  
  // MARK: - Property
  @StateObject private var navigate = NavigationManager()
  
  private let appContainer = DefaultAppDIContainer()
  
  // MARK: - Body
  var body: some View {
    NavigationStack(path: $navigate.path) {
      navigate(to: .productList)
        .navigationDestination(for: Route.self) { page in
          navigate(to: page)
        }
    }
    .environmentObject(navigate)
  }
  
  @ViewBuilder
  private func navigate(to page: Route) -> some View {
    switch page {
    case .productList:
      let productSceneContainer = DefaultProductSceneDIContainer(apiDataTransferService: appContainer.apiDataTransferService)
      ProductListView(viewModel: productSceneContainer.defaultProductListViewModel)
    case .productDetail(let productID):
      let productSceneContainer = DefaultProductSceneDIContainer(apiDataTransferService: appContainer.apiDataTransferService)
      let viewModel = productSceneContainer.defaultProductDetailViewModel(productID)
      ProductDetailView(viewModel: viewModel)
    }
  }
}

#Preview {
    NavigationView()
}
