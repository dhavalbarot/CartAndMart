//
//  Configuration.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - Configuration
protocol AppConfiguration {
  var baseURL: String { get }
}

// MARK: - DeafultAppConfiguration
final class DefaultAppConfiguration: AppConfiguration {
  lazy var baseURL: String = {
      guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
          fatalError("BaseURL must not be empty in plist")
      }
      return apiBaseURL
  }()
}
