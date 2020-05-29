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
    }
   
    override func tearDown() {
       super.tearDown()
    }
    
    func test_loginFailureTest() {
        loginScreen.loginTest()
        XCTAssertEqual(loginScreen.getErrorDisplayed(), "All fields are mandatory.")
    }
    
    func test_loginSuccessTest() {
        loginScreen.setEmailIdWith("test@gmail.com")
        loginScreen.setPasswordWith("abcd1234")
        loginScreen.loginTest()
        XCTAssert(loginScreen.loginSuccessCheck())
    }
    
    func check() {
        
    }
}
