//
//  DefaultProductListRepository.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - DefaultProductListRepository
final class DefaultProductListRepository {
  private let dataTransferService: DataTransferService
  
  init(dataTransferService: DataTransferService) {
    self.dataTransferService = dataTransferService
  }
}

// MARK: - ProductListRepository Implementation
extension DefaultProductListRepository: ProductListRepository {
  func getProductList(completion: @escaping (Result<ProductList, any Error>) -> Void) -> (any Cancellable)? {
    let task = RepositoryTask()
    let endpoint = ProductEndpoints.getProductList()

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
