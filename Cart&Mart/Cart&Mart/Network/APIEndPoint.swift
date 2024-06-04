//
//  APIEndPoint.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - Endpoint
final class Endpoint<R>: ResponseRequestable {
  
  typealias Response = R
  
  // MARK: - Properties
  let path: String
  let isFullPath: Bool
  let method: HTTPMethodType
  let queryParameters: [String: Any]
  let queryParametersEncodable: Encodable?
  let responseDecoder: ResponseDecoder
  
  // MARK: - Initializer
  init(path: String, isFullPath: Bool = false, method: HTTPMethodType, queryParameters: [String: Any] = [:], queryParametersEncodable: Encodable? = nil, responseDecoder: ResponseDecoder = JSONResponseDecoder()) {
    self.path = path
    self.isFullPath = isFullPath
    self.method = method
    self.queryParameters = queryParameters
    self.queryParametersEncodable = queryParametersEncodable
    self.responseDecoder = responseDecoder
  }
}
