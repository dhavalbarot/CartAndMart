//
//  DI.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - MartAndCartDIContainer
protocol MartAndCartDIContainer {
  var apiDataTransferService: DataTransferService { get }
  var productSceneDIContainer: ProductSceneDIContainer { get }
}

// MARK: - DefaultAppDIContainer
final class DefaultAppDIContainer: MartAndCartDIContainer {  
  private var appConfiguration: AppConfiguration
  
  init(appConfiguration: AppConfiguration = DefaultAppConfiguration()) {
      self.appConfiguration = appConfiguration
  }
  
  var apiDataTransferService: DataTransferService {
    let config = APINetworkConfiguration(baseURL: URL(string: appConfiguration.baseURL)!)
    let apiDataNetwork = DefaultNetworkService(config: config)
    let dataTransferService = DefaultDataTransferService(with: apiDataNetwork)
    return dataTransferService
  }
  
  var productSceneDIContainer: ProductSceneDIContainer {
    return DefaultProductSceneDIContainer(apiDataTransferService: apiDataTransferService)
  }
}

// MARK: - ProductSceneDIContainer
protocol ProductSceneDIContainer {
  var apiDataTransferService: DataTransferService { get }
}

// MARK: - ViewModelDIContainer
protocol ViewModelDIContainer {
  var defaultProductListViewModel: DefaultProductListViewModel { get }
  var defaultProductDetailViewModel: ProductDetailViewModel { get }
}

// MARK: - UseCaseDIContainer
protocol UseCaseDIContainer {
  var defaultProductListUseCase: GetProductListUseCase { get }
  var defaultProductDetailUseCase: GetProductDetailUseCase { get }
}

// MARK: - RepositoryDIContainer
protocol RepositoryDIContainer {
  var defaultProductListRepository: ProductListRepository { get }
  var defaultProductDetailRepository: ProductDetailRepository { get }
}

// MARK: - DefaultDIContainer
final class DefaultProductSceneDIContainer: ProductSceneDIContainer {
  var apiDataTransferService: DataTransferService
  
  // MARK: - Initializer
  init(apiDataTransferService: DataTransferService) {
    self.apiDataTransferService = apiDataTransferService
  }
}

// MARK: - ViewModelDIContainer
extension DefaultProductSceneDIContainer: ViewModelDIContainer {
  public var defaultProductListViewModel: DefaultProductListViewModel {
    DefaultProductListViewModel(productListUseCase: defaultProductListUseCase)
  }
  
  var defaultProductDetailViewModel: ProductDetailViewModel {
    DefaultProductDetailViewModel()
  }
}

// MARK: - UseCaseDIContainer
extension DefaultProductSceneDIContainer: UseCaseDIContainer {
  var defaultProductListUseCase: GetProductListUseCase {
    DefaultGetProductListUseCase(repository: defaultProductListRepository)
  }
  
  var defaultProductDetailUseCase: GetProductDetailUseCase {
    DefaultGetProductDetailUseCase(repository: defaultProductDetailRepository)
  }
}

// MARK: - RepositoryDIContainer
extension DefaultProductSceneDIContainer: RepositoryDIContainer {
  var defaultProductListRepository: ProductListRepository {
    DefaultProductListRepository(dataTransferService: apiDataTransferService)
  }
  
  var defaultProductDetailRepository: ProductDetailRepository {
    DefaultProductDetailRepository(dataTransferService: apiDataTransferService)
  }
}
