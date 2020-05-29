//
//  LoginScreen.swift
//  BaseAppUITests
//
//  Created by Aswani G on 5/27/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import XCTest

class LoginScreen: XCTest {
    let app = XCUIApplication()
        
    func setEmailIdWith(_ name: String) {
       let emailTextField = app.textFields["emailTextField"]
       emailTextField.tap()
       emailTextField.typeText(name)
    }
    
    func setPasswordWith(_ pwd: String) {
       let passwordTextField = app.secureTextFields["passwordTextField"]
       app.keyboards.buttons["return"].tap()
       passwordTextField.tap()
       passwordTextField.typeText(pwd)
    }
    
    func loginTest() {
        let login = app.buttons["Login"]
        login.tap()
    }
    
    func getErrorDisplayed() -> String {
        let errorLabel = app.staticTexts["errorLabel"]
        return errorLabel.label
    }
    
    func loginSuccessCheck() -> Bool {
        let dashBoardView = app.otherElements["dashboard"]
        let dashBoardShown = dashBoardView.waitForExistence(timeout: 5)
        return dashBoardShown
    }
}
