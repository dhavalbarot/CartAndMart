//
//  DIContainer.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 06/06/24.
//

import Foundation

// MARK: - DIContainer
class DIContainer {
  
  // MARK: - Shared
  static let shared: DIContainer = .init()
  
  // MARK: - Preoperty
  private var dependencies: [String: Any] = [:]
  
  // MARK: - Function
  func register<T>(type: T.Type, dependency: @escaping () -> T) {
    let key = String(describing: type)
    dependencies[key] =  { dependency() }
  }
  
  func register<T, Arg>(type: T.Type, dependency: @escaping (Arg) -> T) {
    let key = String(describing: type)
    dependencies[key] = { (arg: Int) in
      return dependency(arg as! Arg)
    }
  }
  
  func resolve<T>(type: T.Type) -> T? {
    let key = String(describing: type)
    guard let dependency = dependencies[key] as? () -> T else {
      return nil
    }
    return dependency()
  }
  
  func resolve<T, Arg>(type: T.Type, argument: Arg) -> T? {
    let key = String(describing: type)
    guard let dependency = dependencies[key] as? (Arg) -> T else {
      return nil
    }
    return dependency(argument)
  }
}
