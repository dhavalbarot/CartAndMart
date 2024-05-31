//
//  ProductDetailView.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

struct ProductDetailView: View {
  
  // MARK: - Properties
  @StateObject private var viewModel: DefaultProductDetailViewModel
  
  private var showError: Binding<Bool> {
      Binding(
          get: { viewModel.viewContentState == .error },
          set: { _ in }
      )
  }
  
  // MARK: - Initilizer
  init(viewModel: DefaultProductDetailViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {
      ProductDetailNavigationBarView()
      getBodyItem(viewModel.viewContentState)
    })
    .zIndex(0)
    .background(UIColor.productColor(viewModel.productID).gradient)
    .frame(maxWidth: .infinity)
    .navigationBarBackButtonHidden()
    .edgesIgnoringSafeArea(.bottom)
    .showAlert(isPresented: showError, model: viewModel.contentModel)
    .task {
      guard viewModel.productDetail == nil else { return }
      viewModel.fetchProductDetail()
    }
  }
  
  // MARK: - ViewBuilders
  @ViewBuilder
  func getBodyItem(_ contentState: ViewContentState) -> some View {
    switch contentState {
    case .idle: EmptyView().background(.red)
    case .loading:
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
    case .data:
      withAnimation(.easeIn(duration: 1)) {
        productDetailContentView()
      }
    case .error:
        ContentUnavailableView {
          Label(viewModel.contentModel.title, systemImage: viewModel.contentModel.imageName ?? "")
        } description: {
          Text(viewModel.contentModel.message)
        }
    }
  }
  
  @ViewBuilder
  func productDetailContentView() -> some View {
    if let product = viewModel.productDetail {
      ProductHeaderView(product: product)
        .padding(.leading)
      Spacer()
      ProductDetailImageView(product: product)
        .zIndex(1)
      VStack(alignment: .leading, spacing: 15, content: {
        HStack(alignment: .bottom, content: {
          RatingView(rating: Int(product.rating))
          Spacer()
        })
        Divider()
        Text(product.description)
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(colorGray)
        ProductAdditionalInfoGroupView(product: product)
        Spacer()
        StockStatusView(stockStatus: product.availabilityStatus)
      })
      .padding(.horizontal)
      .padding(.bottom)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -60)
      )
    } else {
      EmptyView()
    }
  }
}

// MARK: - Preview
#Preview {
  let container = DefaultProductSceneDIContainer(apiDataTransferService: DefaultAppDIContainer().apiDataTransferService)
  return ProductDetailView(viewModel: container.defaultProductDetailViewModel(sampleProduct.id))
}
