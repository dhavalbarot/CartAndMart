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
    case .idle: EmptyView()
    case .loading:
      ProgressView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    case .data:
      if let productDetail = viewModel.productDetail {
        withAnimation(.easeInOut(duration: 2)) {
          productDetailContentView(productDetail)
        }
      } else {
        EmptyView()
      }
    case .error:
      ErrorContentView(contentModel: viewModel.contentModel)
    }
  }
  
  @ViewBuilder
  func productDetailContentView(_ productDetail: ProductDetail) -> some View {
    ProductHeaderView(product: productDetail)
      .padding(.leading)
    Spacer()
    ProductDetailImageView(product: productDetail)
      .zIndex(1)
    VStack(alignment: .leading, spacing: 15, content: {
      HStack(alignment: .bottom, content: {
        RatingView(rating: Int(productDetail.rating))
        Spacer()
      })
      Divider()
      Text(productDetail.description)
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(colorGray)
        .accessibilityIdentifier("productDetailDescriptionText")
        .accessibilityLabel("Descripiton: \(productDetail.description)")
      
      ProductAdditionalInfoGroupView(product: productDetail)
      Spacer()
      StockStatusView(stockStatus: productDetail.availabilityStatus)
    })
    .padding(.horizontal)
    .padding(.bottom)
    .background(
      Color.white
        .clipShape(CustomShape())
        .padding(.top, -60)
    )
  }
}

// MARK: - Preview
#Preview {
  let container = DefaultProductSceneDIContainer(apiDataTransferService: DefaultAppDIContainer().apiDataTransferService)
  return ProductDetailView(viewModel: container.defaultProductDetailViewModel(sampleProduct.id))
}
