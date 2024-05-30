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
      let appContainer = DefaultAppDIContainer()
      let productSceneContainer = DefaultProductSceneDIContainer(apiDataTransferService: appContainer.apiDataTransferService)
      ProductListView(viewModel: productSceneContainer.defaultProductListViewModel)
    case .productDetail(let productID):
      ProductDetailView(product: sampleProductDetail)
    }
  }
}

#Preview {
    NavigationView()
}
