//
//  ProductListView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct ProductListView: View {
  
  // MARK: - Properties
  @StateObject private var viewModel: DefaultProductListViewModel
    
  private var showError: Binding<Bool> {
    Binding(
      get: { viewModel.viewContentState == .error },
      set: { _ in }
    )
  }
  
  // MARK: - Initilizer
  init(viewModel: DefaultProductListViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  // MARK: - Body
  var body: some View {
    NavigationStack {
      ZStack {
        VStack(spacing: 0) {
          NavigationBarView()          
          getBodyItem(viewModel.viewContentState)
        }
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      }
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .showAlert(isPresented: showError, model: viewModel.contentModel)
    .task {
      guard viewModel.viewContentState == .idle else { return }
      viewModel.fetchProductList()
    }
  }
  
  // MARK: - ViewBuilders
  @ViewBuilder
  func getBodyItem(_ contentState: ViewContentState) -> some View {
    switch contentState {
    case .idle: EmptyView()
    case .loading:
      ProgressView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    case .data:
      ProductListGridView(products: viewModel.productList)
    case .error:
      ErrorContentView(contentModel: viewModel.contentModel)
    }
  }
}


// MARK: - Preview
#Preview {
  let container = DefaultProductSceneDIContainer(apiDataTransferService: DefaultAppDIContainer().apiDataTransferService)
  return ProductListView(viewModel: container.defaultProductListViewModel)
}
