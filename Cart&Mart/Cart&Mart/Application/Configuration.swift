//
//  Configuration.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

struct Configuration {
  lazy var baseURL: String = {
      guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
          fatalError("ApiBaseURL must not be empty in plist")
      }
      return apiBaseURL
  }()
}
