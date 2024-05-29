//
//  NetworkConfiguration.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

//MARK: - NetworkConfigurable
protocol NetworkConfigurable {
  var baseURL: URL { get }
  var headers: [String: String] { get }
  var queryParameters: [String: String] { get }
}

//MARK: - APINetworkConfiguration
struct APINetworkConfiguration: NetworkConfigurable {
  
  let baseURL: URL
  let headers: [String: String]
  let queryParameters: [String: String]
  
  init(baseURL: URL, headers: [String: String] = [:], queryParameters: [String: String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.queryParameters = queryParameters
  }
}
