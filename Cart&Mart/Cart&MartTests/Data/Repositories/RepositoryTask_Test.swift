//
//  RepositoryTask_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

// MARK: - RepositoryTask_Test
final class RepositoryTask_Test: XCTestCase {
  func testCancelRepositoryTask() {
    // Arrange
    let task = RepositoryTask()
    
    // Act
    task.cancel()
    
    // Assert
    XCTAssertTrue(task.isCancelled)
  }
}
