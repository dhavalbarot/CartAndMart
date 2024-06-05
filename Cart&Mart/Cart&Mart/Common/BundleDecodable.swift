//
//  BundleDecodable.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - Bundle
extension Bundle {
  /**
   Decodes a Codable object from a file.

   - Parameter file: The name of the file containing the Codable object data.
   - Returns: An instance of type `T`, decoded from the file.

   - Note: The file should be located in the application's bundle or filesystem accessible to the application.

   - Throws: An error if decoding fails, such as `DecodingError.dataCorrupted` or `DecodingError.keyNotFound`.
  **/
  func decode<T: Decodable>(_ file: String) -> T {
    
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
