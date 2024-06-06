//
//  NavigationView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - NavigationView
struct AppNavigationView: View {
  
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
      ProductListView(viewModel: DIContainer.shared.resolve(type: DefaultProductListViewModel.self)!)
    case .productDetail(let productID):
      ProductDetailView(viewModel: DIContainer.shared.resolve(type: DefaultProductDetailViewModel.self, argument: productID)!)
    }
  }
}

#Preview {
  AppNavigationView()
}
