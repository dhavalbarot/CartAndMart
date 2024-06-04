//
//  RepositoryTask.swift
//  Cart&Mart
//
//  Created by Dhaval Barot on 29/05/24.
//

import Foundation

/**
 A class representing a cancellable task associated with a repository operation.

 Implements the `Cancellable` protocol.

 - Properties:
   - networkTask: An optional task associated with network operations that conforms to `NetworkCancellable`.
   - isCancelled: A boolean flag indicating whether the task has been cancelled.

 - Note: Calling `cancel()` on an instance of `RepositoryTask` cancels the associated `networkTask`
   and sets `isCancelled` to true.
 */
final class RepositoryTask: Cancellable {
  var networkTask: NetworkCancellable?
  var isCancelled: Bool = false
  
  func cancel() {
    networkTask?.cancel()
    isCancelled = true
  }
}
