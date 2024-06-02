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
  
  @EnvironmentObject private var navigationManager: NavigationManager
  
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
      ScrollView(.vertical, showsIndicators: false, content: {
        VStack(spacing: 0) {
          LazyVGrid(columns: gridLayout, spacing: rowSpacing, content: {
            ForEach(viewModel.productList) { product in
              ProductItemView(product: product)
                .onTapGesture {
                  navigationManager.push(.productDetail(productID: product.id))
                }
            }
          })
          .padding(15)
        }
      })
    case .error:
      ContentUnavailableView {
        Label(viewModel.contentModel.title, systemImage: viewModel.contentModel.imageName ?? "")
      } description: {
        Text(viewModel.contentModel.message)
      }
    }
  }
}

// MARK: - Preview
#Preview {
  let container = DefaultProductSceneDIContainer(apiDataTransferService: DefaultAppDIContainer().apiDataTransferService)
  return ProductListView(viewModel: container.defaultProductListViewModel)
}
