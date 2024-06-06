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
  private var factories: [String: Any] = [:]
  
  // MARK: - Function
  func register<T>(type: T.Type, factory: @escaping () -> T) {
    let key = String(describing: type)
    factories[key] =  { factory() }
  }
  
  func register<T, Arg>(type: T.Type, factory: @escaping (Arg) -> T) {
    let key = String(describing: type)
    factories[key] = { (arg: Int) in
      return factory(arg as! Arg)
    }
  }
  
  func resolve<T>(type: T.Type) -> T? {
    let key = String(describing: type)
    guard let factory = factories[key] as? () -> T else {
      return nil
    }
    return factory()
  }
  
  func resolve<T, Arg>(type: T.Type, argument: Arg) -> T? {
    let key = String(describing: type)
    guard let factory = factories[key] as? (Arg) -> T else {
      return nil
    }
    return factory(argument)
  }
}
