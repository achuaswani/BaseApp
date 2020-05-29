//
//  BaseAppUITests.swift
//  BaseAppUITests
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import XCTest

class BaseAppUITests: XCTestCase {
    let loginScreen = LoginScreen()
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
   
    override func tearDown() {
       super.tearDown()
    }
    
    func test_loginTest() {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
        // To bring the app back
        XCUIApplication().activate()
        loginScreen.loginTest()
                XCTAssertEqual(loginScreen.getErrorDisplayed(), "")
    }
}
