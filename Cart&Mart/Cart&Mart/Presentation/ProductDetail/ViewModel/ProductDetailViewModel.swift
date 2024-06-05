//
//  ProductDetailViewModel.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

// MARK: - ProductDetailViewInput
protocol ProductDetailViewModelInput {
  func fetchProductDetail()
}

// MARK: - ProductDetailViewOutput
protocol ProductDetailViewModelOutput: ObservableObject {
  var productID: Int { get }
  var productDetail: ProductDetail? { get }
  var viewContentState: ViewContentState { get }
  var contentModel: ContentModel { get }
}

// MARK: - ProductDetailViewAction
protocol ProductDetailViewModelAction { }

// MARK: - ProductDetailViewModel
typealias ProductDetailViewModel = ProductDetailViewModelInput & ProductDetailViewModelOutput & ProductDetailViewModelAction

// MARK: - ProductDetailViewModel
final class DefaultProductDetailViewModel: ProductDetailViewModel {

  // MARK: - Properties
  @Published private(set) var productDetail: ProductDetail?
  @Published private(set) var viewContentState: ViewContentState = .idle
  @Published private(set) var contentModel: ContentModel = .init(title: "", message: "")
  @Published private(set) var productID: Int

  private let getProductDetailUseCase: GetProductDetailUseCase

  // MARK: - Initializer
  init(productID: Int, productDetailUseCase: GetProductDetailUseCase) {
    self.productID = productID
    self.getProductDetailUseCase = productDetailUseCase
  }
}

// MARK: - ProductDetailViewInput Implementation
extension DefaultProductDetailViewModel {
  func fetchProductDetail() {
    viewContentState = .loading
    firstly {
      getProductDetailUseCase.getProductDetail(productID)
    } .done { productDetail in
      self.productDetail = productDetail
      self.viewContentState = .data
    } .catch { error in
      self.viewContentState = .error
      self.contentModel = .init(imageName: SystemImageName.basket, title: StringConstants.somethingWentWrong, message: error.localizedDescription)
    }
  }
}

