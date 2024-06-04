//
//  NetworkError.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - NetworkError
/**
 An enumeration representing possible network-related errors.

 Conform to this enum to handle different types of network errors that may occur during network interactions.

 - Cases:
   - error(statusCode: Int, data: Data?): Indicates an error with a specific HTTP status code and optional response data.
   - notConnected: Indicates that the device is not connected to the network.
   - cancelled: Indicates that the network operation was cancelled.
   - generic(Error): Indicates a generic error with an associated `Error` object.
   - urlGeneration: Indicates an error occurred while generating a URL.
 */
enum NetworkError: Error {
  case error(statusCode: Int, data: Data?)
  case notConnected
  case cancelled
  case generic(Error)
  case urlGeneration
}

// MARK: - NetworkError
extension NetworkError {
  var isNotFoundError: Bool { return hasStatusCode(404) }
  
  func hasStatusCode(_ codeError: Int) -> Bool {
    switch self {
    case let .error(code, _):
      return code == codeError
    default: return false
    }
  }
}

// MARK: - NetworkErrorLogger
/**
 A protocol defining methods for logging network request, response, and error details.
 
 Conform to this protocol to implement custom logging behaviors for network interactions.
 
 - Note: Implement `log(request:)`, `log(responseData:response:)`, and `log(error:)` to handle logging of request details, response data, and errors respectively.
 */
protocol NetworkErrorLogger {
  func log(request: URLRequest)
  func log(responseData data: Data?, response: URLResponse?)
  func log(error: Error)
}

// MARK: - DefaultNetworkErrorLogger
final class DefaultNetworkErrorLogger: NetworkErrorLogger {
  init(){}
  
  func log(request: URLRequest) {
    print("-------------")
    print("request: \(String(describing: request.url))")
    print("headers: \(request.allHTTPHeaderFields ?? [:])")
    print("method: \(request.httpMethod ?? "")")
    if let httpBody = request.httpBody,
        let result = ((try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject]) as [String: AnyObject]??) {
      printIfDebug("body: \(String(describing: result))")
    } else if let httpBody = request.httpBody, let resultString = String(data: httpBody, encoding: .utf8) {
      printIfDebug("body: \(String(describing: resultString))")
    }
  }
  
  func log(responseData data: Data?, response: URLResponse?) {
    guard let data = data else { return }
    if let dataDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
      printIfDebug("responseData: \(String(describing: dataDict))")
    }
  }
  
  func log(error: Error) {
    printIfDebug("\(error)")
  }
}


// MARK: - PrintIfDebug
/**
 Prints the given string to the console if the build configuration is set to DEBUG.
 
 Use this function to print debugging information that should only be active in DEBUG builds.
 
 - Parameter string: The string to print.
 */
func printIfDebug(_ string: String) {
#if DEBUG
  print(string)
#endif
}
