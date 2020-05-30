//
//  LoginScreen.swift
//  BaseAppUITests
//
//  Created by Aswani G on 5/27/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import XCTest

class LoginScreen: BaseAppUITests {
    
    func test_loginFailureTest() {
        let errorLabel = app.staticTexts["errorLabel"]
        loginTap()
        XCTAssertEqual(errorLabel.label, "All fields are mandatory.")
    }
  
    func test_loginSuccessTest() {
        
        let dashBoardView = app.otherElements["dashboard"]
        setEmailIdWith("test@gmail.com")
        setPasswordWith("abcd1234")
        loginTap()
        XCTAssert(dashBoardView.waitForExistence(timeout: 5))
    }
    
    func setEmailIdWith(_ name: String) {
       let emailTextField = app.textFields["emailTextField"]
       emailTextField.tap()
       emailTextField.typeText(name)
    }
    
    func setPasswordWith(_ pwd: String) {
       app.keyboards.buttons["return"].tap()
       let passwordTextField = app.secureTextFields["passwordTextField"]
       passwordTextField.tap()
       passwordTextField.typeText(pwd)
    }
    
    func loginTap() {
        let login = app.buttons["Login"]
        login.tap()
    }
}
