//
//  UtilityTests.swift
//  Cart&MartTests
//
//  Created by Dhaval Barot on 05/06/24.
//

import XCTest
@testable import Cart_Mart

final class UtilityTests: XCTestCase {
  func testFormatPriceToUSD() {
    // Test for a regular price
    XCTAssertEqual(formatPriceToUSD(1234.56), "$1,234.56")
    
    // Test for zero price
    XCTAssertEqual(formatPriceToUSD(0.0), "$0.00")
        
    // Test for a small price
    XCTAssertEqual(formatPriceToUSD(0.99), "$0.99")
    
    // Test for a negative price
    XCTAssertEqual(formatPriceToUSD(-1234.56), "-$1,234.56")
    
    // Test for price with no cents
    XCTAssertEqual(formatPriceToUSD(1234), "$1,234.00")
  }
}
