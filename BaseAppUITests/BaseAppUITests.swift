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
    }
   
    override func tearDown() {
       super.tearDown()
    }
    
    func appLaunch() {
        app.launchArguments.append("BaseAppUITest")
        app.launch()
    }
    
}
