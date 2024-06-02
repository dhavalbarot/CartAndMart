//
//  Configuration_Test.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 31/05/24.
//

import XCTest
@testable import Cart_Mart

final class Configuration_Test: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAppConfiguration() throws {
    // Act
    let url: String = "https://dummyjson.com/"
    
    // Arrange
    let mockConfig = DefaultAppConfiguration()
    
    // Assert
    XCTAssertEqual(mockConfig.baseURL, url)
  }
}
