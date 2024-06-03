//
//  Cart_MartUITestsLaunchTests.swift
//  Cart&MartUITests
//
//  Created by Dhaval Barot on 29/05/24.
//

import XCTest

final class Cart_MartUITestsLaunchTests: XCTestCase {
  
  override class var runsForEachTargetApplicationUIConfiguration: Bool {
    true
  }
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  func testLaunch() throws {
    let app = XCUIApplication()
    app.launch()
        
    let attachment = XCTAttachment(screenshot: app.screenshot())
    attachment.name = "Launch Screen"
    attachment.lifetime = .keepAlways
    add(attachment)
  }
}
