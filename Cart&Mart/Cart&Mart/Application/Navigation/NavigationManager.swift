//
//  NavigationManager.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 30/05/24.
//

import SwiftUI

// MARK: - RouteProtocol
protocol RouteProtocol: Hashable, Identifiable {
  var id: String { get }
  var params: Any? { get }
}

// MARK: - Route
enum Route: RouteProtocol {
  
  case productList
  case productDetail(productID: Int)
  
  var id: String {
    switch self {
    case .productList:
      return "ProductListScreen"
    case .productDetail:
      return "ProductDetailScreen"
    }
  }
  
  var params: Any? {
    switch self {
    case .productList:
      return nil
    case .productDetail(let productId):
      return productId
    }
  }
}

// MARK: - NavigationManagerProtocol
protocol NavigationManagerProtocol: ObservableObject {
  associatedtype RoutePage: RouteProtocol
  var path: NavigationPath { get set }
  
  func push(_ page: RoutePage)
  func pop()
  func popToRoot()
}

// MARK: - NavigationManager
public class NavigationManager: NavigationManagerProtocol {
  typealias RoutePage = Route
  @Published var path = NavigationPath()
  
  func push(_ page: Route) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
}
