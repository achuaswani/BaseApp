//
//  RegisterScreen.swift
//  BaseAppUITests
//
//  Created by Aswani G on 5/29/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import XCTest

class RegisterScreen: BaseAppUITests {
    
    func test_registerFailureTest() {
        appLaunch()
        let loginScreen = LoginScreen()
        loginScreen.registerButtonTap()
        let registerButton =  app.buttons["registerButton"]
        registerButton.tap()
        let errorLabel = app.staticTexts["errorLabel"]
        XCTAssertEqual(errorLabel.label, "All fields are mandatory.")
        sleep(5)
    }
    
    func test_registerNewAccount() {
        let email = app.textFields["emailTextField"]
        let identifier = UUID()
        email.tap()
        email.typeText(("test\(identifier)@gmail.com"))
        app.keyboards.buttons["return"].tap()
        let password = app.secureTextFields["passwordField"]
        password.tap()
        password.typeText("abcd1234")
        app.keyboards.buttons["return"].tap()
         let confirmPassword = app.secureTextFields["confirmPasswordField"]
        confirmPassword.tap()
        confirmPassword.typeText("abcd1234")
        app.keyboards.buttons["return"].tap()
        let displayName = app.textFields["userNameTextField"]
        displayName.tap()
        displayName.typeText("test\(identifier)")
        let registerButton = app.buttons["registerButton"]
        registerButton.tap()
        let dashBoardView = app.otherElements["dashboard"]
        XCTAssert(dashBoardView.waitForExistence(timeout: 5))
    }
    
}
