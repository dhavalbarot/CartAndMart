//
//  DefaultProductDetailRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

final class DefaultProductDetailRepository {
  private let dataTransferService: DataTransferService
  
  init(dataTransferService: DataTransferService) {
    self.dataTransferService = dataTransferService
  }
}

extension DefaultProductDetailRepository: ProductDetailRepository {
  func getProductDetail(_ productID: Int, completion: @escaping (Result<ProductDetail, any Error>) -> Void) -> (any Cancellable)? {
    let task = RepositoryTask()
    let endpoint = ProductEndpoints.getProductDetail(productID)

    task.networkTask = self.dataTransferService.request(
        with: endpoint
    ) { result in
        switch result {
        case .success(let responseDTO):
          completion(.success(responseDTO.toDomain()))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    return task
  }
}
