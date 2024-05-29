//
//  ResponseDecoder.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

//MARK: - ResponseDecoder
protocol ResponseDecoder {
  func decode<T: Decodable>(_ data: Data) throws -> T
}

//MARK: - JSONResponseDecoder
final class JSONResponseDecoder: ResponseDecoder {
  
  private let jsonDecoder = JSONDecoder()
  
  init(){}
  
  func decode<T: Decodable>(_ data: Data) throws -> T {
    return try jsonDecoder.decode(T.self, from: data)
  }
}

//MARK: - JSONResponseDecoder
final class RawDataResponseDecoder: ResponseDecoder {
  
  init(){}
  
  enum CodingKeys: String, CodingKey {
    case `default` = ""
  }
  
  func decode<T: Decodable>(_ data: Data) throws -> T {
    if T.self is Data.Type, let data = data as? T {
      return data
    } else {
      let context = DecodingError.Context(
        codingPath: [CodingKeys.default],
        debugDescription: "Expected Data type"
      )
      throw Swift.DecodingError.typeMismatch(T.self, context)
    }
  }
}

