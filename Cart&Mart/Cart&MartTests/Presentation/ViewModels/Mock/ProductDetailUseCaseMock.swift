//
//  ProductDetailUseCase.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import Foundation
import PromiseKit
@testable import Cart_Mart

final class ProductDetailUseCaseMock: GetProductDetailUseCase {
  let productDetail: ProductDetail?
  let error: Error?
  
  init(productDetail: ProductDetail? = nil, error: Error? = nil){
    self.productDetail = productDetail
    self.error = error
  }
  
  func getProductDetail(_ productID: Int) -> Promise<ProductDetail> {
    return Promise<ProductDetail> { seal in
      if let detail = productDetail {
        seal.fulfill(detail)
      } else {
        seal.reject(error ?? ProductUseCaseError.productDetailFailure)
      }
    }
  }
}
