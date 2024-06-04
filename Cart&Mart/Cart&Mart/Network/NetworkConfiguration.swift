//
//  NetworkConfiguration.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

/**
 A protocol defining configuration properties for network requests.
 
 Conform to this protocol to provide base URL, headers, and query parameters for network requests.
 
 - Properties:
 - baseURL: The base URL for network requests.
 - headers: The HTTP headers to include in network requests.
 - queryParameters: The query parameters to append to network request URLs.
 */
protocol NetworkConfigurable {
  /// The base URL for network requests.
  var baseURL: URL { get }
  
  /// The HTTP headers to include in network requests.
  var headers: [String: String] { get }
  
  /// The query parameters to append to network request URLs.
  var queryParameters: [String: String] { get }
}

// MARK: - APINetworkConfiguration
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
