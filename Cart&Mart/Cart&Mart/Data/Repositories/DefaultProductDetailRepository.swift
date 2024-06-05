//
//  DefaultProductDetailRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation
import PromiseKit

// MARK: - DefaultProductDetailRepository
final class DefaultProductDetailRepository {
  private let dataTransferService: DataTransferService
  
  init(dataTransferService: DataTransferService) {
    self.dataTransferService = dataTransferService
  }
}

// MARK: - ProductDetailRepository Implementation
extension DefaultProductDetailRepository: ProductDetailRepository {
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail> {
    let endpoint = ProductEndpoints.getProductDetail(productID)
    return Promise<ProductDetail> { seal in
      self.dataTransferService.request(with: endpoint) { result in
        switch result {
        case .success(let productDetailDTO):
          seal.fulfill(productDetailDTO.toDomain())
        case .failure(let error):
          seal.reject(error)
        }
      }
    }
  }
}
