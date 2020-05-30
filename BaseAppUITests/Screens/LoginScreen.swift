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
        appLaunch()
        let errorLabel = app.staticTexts["errorLabel"]
        loginButtonTap()
        XCTAssertEqual(errorLabel.label, "All fields are mandatory.")
        sleep(5)
    }
  
    func test_loginSuccessTest() {
        
        let dashBoardView = app.otherElements["dashboard"]
        setEmailIdWith("test@gmail.com")
        setPasswordWith("abcd1234")
        loginButtonTap()
        XCTAssert(dashBoardView.waitForExistence(timeout: 5))
        sleep(5)
    }
    
    func test_registerOpenTest() {
        appLaunch()
        registerButtonTap()
        let registerView = app.otherElements["register"]
        XCTAssert(registerView.waitForExistence(timeout: 5))
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
    
    func loginButtonTap() {
        let login = app.buttons["Login"]
        login.tap()
    }
    
    func registerButtonTap() {
        let register = app.buttons["registerButton"]
        register.tap()
    }
}
