//
//  RepositoryTask_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class RepositoryTask_Test: XCTestCase {
  func testCancelRepositoryTask() {
    let task = RepositoryTask()
    
    task.cancel()
    
    XCTAssertTrue(task.isCancelled)
  }
}
