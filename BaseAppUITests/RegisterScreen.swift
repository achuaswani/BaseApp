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
    
}
