//
//  NYTimesUITests.swift
//  NYTimesUITests
//
//  Created by ahmed abdalla on 10/06/2022.
//

import XCTest

class NYTimesUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments.append("--UITests")
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNYTimes(){
        changePeriodTest()
        searchArticleTst()
        articleDetailsTest()
    }
    
    func changePeriodTest(){
        
        let barItem = app.navigationBars["NY Times Most Popular"].children(matching: .button).element(boundBy: 2)
        XCTAssertTrue(barItem.waitForExistence(timeout: 10))
        barItem.tap()
        
        let today = app.tables.staticTexts["Today"]
        XCTAssertTrue(today.waitForExistence(timeout: 10))
        today.tap()
        
        XCTAssertTrue(barItem.waitForExistence(timeout: 10))
        barItem.tap()
        
        let week = app.tables.staticTexts["Week"]
        XCTAssertTrue(week.waitForExistence(timeout: 10))
        week.tap()
        
        XCTAssertTrue(barItem.waitForExistence(timeout: 10))
        barItem.tap()
        
        let month = app.tables.staticTexts["Month"]
        XCTAssertTrue(month.waitForExistence(timeout: 10))
        month.tap()
    }
    
    func searchArticleTst(){
        
        let barItem = app.navigationBars["NY Times Most Popular"].children(matching: .button).element(boundBy: 1)
        XCTAssertTrue(barItem.waitForExistence(timeout: 10))
        barItem.tap()
        
        
        let searchField = app.navigationBars["Search"].searchFields["Search"]
        XCTAssertTrue(searchField.waitForExistence(timeout: 10))
        searchField.tap()
        
        searchField.typeText("he")
        
        app.buttons["Search"].tap()
        
        let cell = app.tables.cells.firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: 10))
        cell.tap()
        
        
        let backButton = app.navigationBars["Article Details"].buttons.element(boundBy: 0)
        XCTAssertTrue(backButton.waitForExistence(timeout: 10))
        backButton.tap()
        
    }
    
    func articleDetailsTest(){
        let tableCell = app.tables.cells.firstMatch
        XCTAssertTrue(tableCell.waitForExistence(timeout: 10))
        tableCell.tap()
        
        let cell = app.scrollViews.otherElements.staticTexts.firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: 10))
        cell.swipeUp()
        
//        let more = app.staticTexts["read more"]
//        XCTAssertTrue(more.waitForExistence(timeout: 10))
//        more.swipeUp()
        
//        app.navigationBars.firstMatch.buttons["Article Details"].tap()
//        app.navigationBars["Article Details"].buttons["NY Times Most Popular"].tap()
    }
}

