//
//  APIRequest.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

//MARK: - HTTPMethodType
enum HTTPMethodType: String {
  case get = "GET"
  case post = "POST"
}

//MARK: - Requestable
protocol Requestable {
  var path: String { get }
  var isFullPath: Bool { get }
  var method: HTTPMethodType { get }
  var queryParameters: [String: Any] { get }
  var queryParametersEncodable: Encodable? { get }
  
  func urlRequest(with networkConfig: NetworkConfigurable) throws -> URLRequest
}

//MARK: - Requestable
extension Requestable {

  func urlRequest(with config: NetworkConfigurable) throws -> URLRequest {
    let url = try self.url(with: config)
    var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
    urlRequest.httpMethod = method.rawValue
    return urlRequest
  }
  
  func url(with config: NetworkConfigurable) throws -> URL {
    let baseURL = config.baseURL.absoluteString.last != "/" ? config.baseURL.absoluteString + "/" : config.baseURL.absoluteString
    let endpoint = isFullPath ? path : baseURL.appending(path)
    
    guard var urlComponents = URLComponents(string: endpoint) else { throw RequestGenerationError.components }
    var urlQueryItems = [URLQueryItem]()
    
    let queryParameters = try queryParametersEncodable?.toDictionary() ?? self.queryParameters
    queryParameters.forEach {
      urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
    }
    config.queryParameters.forEach {
      urlQueryItems.append(URLQueryItem(name: $0.key, value: $0.value))
    }
    urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
    
    guard let url = urlComponents.url else { throw RequestGenerationError.components }
    return url
  }
}

//MARK: - ResponseRequestable
protocol ResponseRequestable: Requestable {
  associatedtype Response
  var responseDecoder: ResponseDecoder { get }
}

//MARK: - RequestGenerationError
enum RequestGenerationError: Error {
  case components
}


//MARK: - Encodable
private extension Encodable {
  func toDictionary() throws -> [String: Any]? {
    let data = try JSONEncoder().encode(self)
    let jsonData = try JSONSerialization.jsonObject(with: data)
    return jsonData as? [String : Any]
  }
}
