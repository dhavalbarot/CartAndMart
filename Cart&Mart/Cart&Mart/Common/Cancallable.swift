//
//  Cancallable.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

// MARK: - Cancallable
/**
 A protocol representing a cancellable task.
 
 Conform to this protocol to define objects that can be cancelled.
 
 - Note: Implement `cancel()` to define the cancellation behavior of the task.
 */
protocol Cancellable {
  /**
   Cancels the task.
   
   Implement this method to cancel the task associated with the conforming object.
   */
  func cancel()
}
