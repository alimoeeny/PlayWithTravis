//
//  PlayWithTravisUITests.swift
//  PlayWithTravisUITests
//
//  Created by Ali Moeeny on 10/2/15.
//  Copyright © 2015 Ali Moeeny. All rights reserved.
//

import XCTest

class PlayWithTravisUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTabSwitch() {
        let app = XCUIApplication()
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.buttons["Second"].tap()
        XCTAssertTrue(app.buttons["Second Button"].exists, "Second button missing")
        XCTAssertFalse(app.buttons["First Button"].exists, "First button is on when it shouldn't be")
        tabBarsQuery.buttons["First"].tap()
        XCTAssertTrue(app.buttons["First Button"].exists, "First button missing")
        XCTAssertFalse(app.buttons["Second Button"].exists, "second button is on when it shouldn't be")
    }
    
}
