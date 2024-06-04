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
  /// A lazily initialized base URL string.
  ///
  /// This property retrieves the `BaseURL` value from the app's main bundle's info dictionary (`Info.plist`).
  /// The `BaseURL` value is expected to be a non-empty string. If the value is not found or is empty,
  /// the application will terminate with a fatal error.
  ///
  /// The base URL is typically used for network requests to define the root URL for API endpoints.
  ///
  /// - Important: Ensure that the `BaseURL` key is set in the `Info.plist` file of the app's main bundle.
  /// - Precondition: The `BaseURL` key in `Info.plist` must not be empty.
  ///
  /// - Returns: A `String` representing the base URL.
  lazy var baseURL: String = {
      guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String else {
          fatalError("BaseURL must not be empty in plist")
      }
      return apiBaseURL
  }()
}
