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
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        sleep(1)
    }
   
    override func tearDown() {
       super.tearDown()
       app.terminate()
       app = nil
    }
    
    func test_loginTest() {
        loginScreen.loginTest()
        XCTAssertEqual(loginScreen.getErrorDisplayed(), "All fields are mandatory.")
    }
}
