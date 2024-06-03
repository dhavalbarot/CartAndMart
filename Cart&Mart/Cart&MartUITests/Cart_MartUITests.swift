//
//  Cart_MartUITests.swift
//  Cart&MartUITests
//
//  Created by Dhaval Barot on 29/05/24.
//

import XCTest

final class Cart_MartUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUpWithError() throws {
    app = XCUIApplication()
    continueAfterFailure = false
    app.launch()
  }
  
  override func tearDownWithError() throws {
    app = nil
  }
  
  func testProductListNavigationExists() throws {
    let logoElement = app.images["CartAndMartLogo"]
    XCTAssertTrue(logoElement.waitForExistence(timeout: 5), "Cart and Mart, logo should be visible.")

    let titleElement = app.images["CartAndMartTitle"]
    XCTAssertTrue(titleElement.waitForExistence(timeout: 5), "Cart and Mart, title should be visible.")
    
    let buttonElement = app.buttons["productListCartButton"]
    XCTAssertTrue(buttonElement.waitForExistence(timeout: 5), "Cart and Mart, cart button should be visible.")
  }
  
  func testGridItemsExistence() throws {
    let grid = app.otherElements["productListGridView"]
    XCTAssertTrue(grid.waitForExistence(timeout: 5), "The product lazygrid should be visible")
    
    let predicate = NSPredicate(format: "identifier BEGINSWITH 'ProductItem_'")
    
    let gridItem = grid.descendants(matching: .any).element(matching: predicate)
    XCTAssertTrue(gridItem.waitForExistence(timeout: 5), "The grid item should be visible")
    
    let gridItems = grid.descendants(matching: .any).matching(predicate)
    XCTAssertTrue(gridItems.count > 0, "There should be at least one grid item visible")
    
    let firstGridItem = gridItems.element(boundBy: 0)
    XCTAssertTrue(firstGridItem.exists, "The first grid item should be visible")
  }
  
  func testProductDetailNavigatoin() throws {
    let grid = app.otherElements["productListGridView"]
    let predicate = NSPredicate(format: "identifier BEGINSWITH 'ProductItem_'")
    let gridItems = grid.descendants(matching: .any).matching(predicate)
    let firstGridItem = gridItems.element(boundBy: 0)
    firstGridItem.tap()
    
    // Add assertions to verify expected output
    let backButtonItem = app.buttons["productDetailBackButton"]
    XCTAssertTrue(backButtonItem.waitForExistence(timeout: 5), "Back button should be visible.")
  }
  
  func testProductDetailExistence() throws {
    let grid = app.otherElements["productListGridView"]
    let predicate = NSPredicate(format: "identifier BEGINSWITH 'ProductItem_'")
    let gridItems = grid.descendants(matching: .any).matching(predicate)
    let firstGridItem = gridItems.element(boundBy: 0)
    firstGridItem.tap()

    //Detail Screen Elements
    let categoryElement = app.staticTexts["productDetailCategoryText"]
    let titleElement = app.staticTexts["productDetailTitleText"]
    let brandElement = app.staticTexts["productDetailBrandText"]
    let discountElement = app.staticTexts["productDetailDiscountTag"]
    let ratingElement = app.staticTexts["ratingView"]
    let descriiptionElement = app.staticTexts["productDetailDescriptionText"]

    //Add more elements...
    XCTAssertTrue(categoryElement.waitForExistence(timeout: 5), "Category should be visible")
    XCTAssertTrue(titleElement.waitForExistence(timeout: 5), "Title should be visible")
    XCTAssertTrue(brandElement.waitForExistence(timeout: 5), "Brand should be visible")
    XCTAssertTrue(discountElement.waitForExistence(timeout: 5), "Discount should be visible")
    XCTAssertTrue(ratingElement.waitForExistence(timeout: 5), "Rating should be visible")
    XCTAssertTrue(descriiptionElement.waitForExistence(timeout: 5), "Description should be visible")
  }
}
