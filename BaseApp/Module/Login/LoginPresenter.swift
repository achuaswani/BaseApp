//
//  LoginPresenter.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol LoginPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol LoginPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol LoginPresenterToViewType: class {
    func start()
    func loginUser(email: String, password: String)
}

class LoginPresenter: LoginPresenterToInteractorType, LoginPresenterToRouterType, LoginPresenterToViewType {

    // MARK: Properties

    weak var view: LoginView?
    var router: LoginRouter?
    var interactor: LoginInteractor?
    
    func start(){

    }
    
    func loginUser(email: String, password: String) {
        guard email.isValidEmail else {
            view?.display(errorMessage: "login.label.email.validation.error.message".localized())
            return
        }
        
        guard password.count >= 8 else {
            view?.display(errorMessage: "login.label.password.validation.error.message".localized())
            return
        }
        
        interactor?.loginUser(email: email, password: password) { [weak self] user, error in
            guard let self = self else { return }
            guard let userData = user else {
                if let error = error {
                    self.view?.display(errorMessage: error.localizedDescription)
                } else {
                    self.view?.display(errorMessage: "login.label.invalid.error.message".localized())
                }
                return
            }
            self.view?.routeToDashboard(with: userData)
        }
    }
}
