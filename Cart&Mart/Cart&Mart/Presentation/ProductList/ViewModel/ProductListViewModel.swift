//
//  ProductListViewModel.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - ProductListViewInput
protocol ProductListViewModelInput {
  func fetchProductList()
}

// MARK: - ProductListViewOutput
protocol ProductListViewModelOutput: ObservableObject {
  var productList: [Product] { get }
  var viewContentState: ViewContentState { get }
}

// MARK: - ProductListViewAction
protocol ProductListViewModelAction {
  
}

// MARK: - ProductListViewModel
protocol ProductListViewModel: ProductListViewModelInput, ProductListViewModelOutput, ProductListViewModelAction {}

// MARK: - ProductListViewModel
final class DefaultProductListViewModel: ProductListViewModel {
  
  // MARK: - Properties
  @Published private(set) var productList: [Product] = []
  @Published private(set) var viewContentState: ViewContentState = .idle
  
  private let getProductListUseCase: GetProductListUseCase

  private var loadingTask: Cancellable? {
    willSet {
      loadingTask?.cancel()
    }
  }

  // MARK: - Initializer
  init(productListUseCase: GetProductListUseCase) {
    self.getProductListUseCase = productListUseCase
  }
}

// MARK: - ProductListViewInput
extension DefaultProductListViewModel {
  func fetchProductList() {
    viewContentState = .loading
    Task {
      loadingTask = getProductListUseCase.getProductList { [weak self] result in
        DispatchQueue.main.async { [weak self] in
          guard let self else { return }
          switch result {
          case .success(let productList):
            self.productList = productList.products
            self.viewContentState = .data
          case .failure(let error):
            self.viewContentState = .error
          }
        }
      }
    }
  }
}
