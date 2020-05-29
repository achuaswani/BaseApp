//
//  LoginScreen.swift
//  BaseAppUITests
//
//  Created by Aswani G on 5/27/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import XCTest

class LoginScreen: XCTest {
    static let app = XCUIApplication()
    private let collectionViews = app.collectionViews.cells.otherElements
    private let emailTextField = app.textFields["emailTextField"]
    private let passwordTextField = app.textFields["passwordField"]
    private let errorLabel = app.staticTexts["errorLabel"]
    private let login = app.buttons["Login"]
    
    func setEmailIdWith(_ name: String) {
       emailTextField.tap()
       emailTextField.typeText(name)
    }
    
    func setPasswordWith(_ pwd: String) {
       passwordTextField.tap()
       passwordTextField.typeText(pwd)
    }
    
    func loginTest() {
        login.tap()
    }
    
    func isErrorDisplayed(error: String) -> Bool {
        let player = errorLabel.staticTexts["\(error)"]
        return (player.exists)
        
    }
    
}
