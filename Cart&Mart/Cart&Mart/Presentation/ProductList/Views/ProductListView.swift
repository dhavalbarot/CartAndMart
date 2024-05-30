//
//  ProductListView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

struct ProductListView: View {
  
  // MARK: - Properties
  @ObservedObject private var viewModel: DefaultProductListViewModel
  
  private var showError: Binding<Bool> {
      Binding(
          get: { viewModel.viewContentState == .error },
          set: { _ in }
      )
  }
  
  // MARK: - Initilizer
  init(viewModel: DefaultProductListViewModel) {
    self.viewModel = viewModel
  }
  
  // MARK: - Body
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack(spacing: 0) {
          NavigationBarView()
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, geometry.safeAreaInsets.top)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
          
          getBodyItem(viewModel.viewContentState)
          
        } //: VSTACK
        .background(backgroundColor.ignoresSafeArea(.all, edges: .all))
      }//: ZSTACK
      .ignoresSafeArea(.all, edges: .all)
    }
    .showAlert(isPresented: showError, model: viewModel.contentModel)
    .task {
      guard viewModel.productList.isEmpty else { return }
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
            } //: LOOP
          }) //: GRID
          .padding(15)
        } //: VSTACK
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

#Preview {
  let container = DefaultProductSceneDIContainer(apiDataTransferService: DefaultAppDIContainer().apiDataTransferService)
  return ProductListView(viewModel: container.defaultProductListViewModel)
}
