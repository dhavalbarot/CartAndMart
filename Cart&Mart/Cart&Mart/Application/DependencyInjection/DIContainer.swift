//
//  DIContainer.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 06/06/24.
//

import Foundation

class DIContainer: ObservableObject {
  
  private var factories: [String: Any] = [:]
  
  func register<T>(type: T.Type, factory: @escaping () -> T) {
    let key = String(describing: type)
    factories[key] = {
      return factory()
    }
  }
  
  func register<T, Arg>(type: T.Type, factory: @escaping (Arg) -> T) {
    let key = String(describing: type)
    factories[key] = { (arg: Any) in
      return factory(arg as! Arg)
    }
  }
  
  func resolve<T>(type: T.Type) -> T? {
    let key = String(describing: type)
    guard let factory = factories[key] as? () -> Any else {
      return nil
    }
    return factory() as? T
  }
  
  func resolve<T, Arg>(type: T.Type, argument: Arg) -> T? {
    let key = String(describing: type)
    guard let factory = factories[key] as? (Arg) -> Any else {
      return nil
    }
    return factory(argument) as? T
  }
}

