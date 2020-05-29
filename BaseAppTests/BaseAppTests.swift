//
//  BaseAppTests.swift
//  BaseAppTests
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import XCTest
@testable import BaseApp

class BaseAppTests: XCTestCase {
    var sut: RegisterView!
    
    override func setUp() {
        super.setUp()
        sut = RegisterView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func checkifNotEmpty() {
        let isNotEmpty = sut.checkNotEmpty(value: "")
        XCTAssertEqual(true, isNotEmpty)
    }

    /*func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/

}
