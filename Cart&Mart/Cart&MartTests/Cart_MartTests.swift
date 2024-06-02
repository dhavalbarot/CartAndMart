//
//  Cart_MartTests.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 29/05/24.
//

import XCTest
@testable import Cart_Mart

final class Cart_MartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func test_roundedRect() {
    let roundedCorner = RoundedCorner()
    let path = roundedCorner.path(in: .zero)
    
    XCTAssertNotNil(roundedCorner)
    XCTAssertNotNil(path)
  }
}
