//
//  DefaultProductListRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

// MARK: - DefaultProductListRepository
final class DefaultProductListRepository {
  private let dataTransferService: DataTransferService
  
  init(dataTransferService: DataTransferService) {
    self.dataTransferService = dataTransferService
  }
}

// MARK: - ProductListRepository Implementation
extension DefaultProductListRepository: ProductListRepository {
  func getProductList() -> Promise<ProductList> {
    let endpoint = ProductEndpoints.getProductList()
    return Promise<ProductList> { seal in
      self.dataTransferService.request(with: endpoint) { result in
        switch result {
        case .success(let responseDTO):
          seal.fulfill(responseDTO.toDomain())
        case .failure(let error):
          seal.reject(error)
        }
      }
    }
  }
}
