//
//  Cart_MartApp.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import SwiftUI

@main
struct Cart_MartApp: App {
  
  // MARK: - Property
  private var container: DIContainer = DIContainer.shared
  
  // MARK: - Initilize
  init() {
    registerDependenceis()
  }

  // MARK: - Register Dependenceis
  private func registerDependenceis() {
    // MARK: - Register App Configuration
    container.register(type: AppConfiguration.self) {
      DefaultAppConfiguration()
    }
    
    // MARK: - Register Network Configuration
    container.register(type: APINetworkConfiguration.self) {
      APINetworkConfiguration(baseURL: URL(string: container.resolve(type: AppConfiguration.self)!.baseURL)!)
    }
    
    // MARK: - Register Network Services
    container.register(type: NetworkService.self) {
      DefaultNetworkService(config: container.resolve(type: APINetworkConfiguration.self)!)
    }
    
    // MARK: - Register Data Trasfer Services
    container.register(type: DataTransferService.self) {
      DefaultDataTransferService(with: container.resolve(type: NetworkService.self)!)
    }
    
    // MARK: - Register Repositoreis
    container.register(type: ProductListRepository.self) {
      DefaultProductListRepository(dataTransferService: container.resolve(type: DataTransferService.self)!)
    }
    
    container.register(type: ProductDetailRepository.self) {
      DefaultProductDetailRepository(dataTransferService: container.resolve(type: DataTransferService.self)!)
    }
    
    // MARK: - Register Use Cases
    container.register(type: GetProductListUseCase.self) {
      DefaultGetProductListUseCase(repository: container.resolve(type: ProductListRepository.self)!)
    }
    
    container.register(type: GetProductDetailUseCase.self) {
      DefaultGetProductDetailUseCase(repository: container.resolve(type: ProductDetailRepository.self)!)
    }
    
    // MARK: - Register View Models
    container.register(type: DefaultProductListViewModel.self) {
      DefaultProductListViewModel(productListUseCase: container.resolve(type: GetProductListUseCase.self)!)
    }
    
    container.register(type: DefaultProductDetailViewModel.self) { (productID: Int) in
      DefaultProductDetailViewModel(productID: productID, productDetailUseCase: container.resolve(type: GetProductDetailUseCase.self)!)
    }
  }
  
  // MARK: - Body
  var body: some Scene {
    WindowGroup {
      AppNavigationView()
    }
  }
}
