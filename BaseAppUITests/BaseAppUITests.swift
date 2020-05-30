//
//  BaseAppUITests.swift
//  BaseAppUITests
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import XCTest

class BaseAppUITests: XCTestCase {
    var app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launchArguments.append("BaseAppUITest")
        app.launch()
    }
   
    override func tearDown() {
       app.terminate()
       super.tearDown()
    }
}
