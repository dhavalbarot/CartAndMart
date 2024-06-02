//
//  BundleDecodable.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    
    // Creating a decoder
    let decoder = JSONDecoder()

    // 1. Locate the JSON file
    // 2. Create a property for the data
    // 3. Create a property for the decoded data
    guard let url = self.url(forResource: file, withExtension: nil),
          let data = try? Data(contentsOf: url), 
            let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    // 4. Return the ready-to-use data
    return decodedData
  }
}
