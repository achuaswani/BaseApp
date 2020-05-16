//
//  RegisterPresenter.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol RegisterPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol RegisterPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol RegisterPresenterToViewType: class {
    func start()
    func registerUser(email: String, password: String, confirmPassword: String)
}

class RegisterPresenter: RegisterPresenterToInteractorType, RegisterPresenterToRouterType, RegisterPresenterToViewType {

    // MARK: Properties

    weak var view: RegisterView?
    var router: RegisterRouter?
    var interactor: RegisterInteractor?
    
    func start(){

    }
    
    func registerUser(email: String, password: String, confirmPassword: String) {
        guard password == confirmPassword else {
            view?.display(errorMessage: "register.label.confirm.password.error.message".localized())
            return
        }
        
        guard email.isValidEmail else {
            view?.display(errorMessage: "login.label.email.validation.error.message".localized())
            return
        }
        
        guard password.count >= 8  else {
            view?.display(errorMessage: "login.label.password.validation.error.message".localized())
            return
        }
        
        guard password.count >= 8 else {
            view?.display(errorMessage: "login.label.password.min.error.message".localized())
            return
        }
        
        interactor?.registerUser(email: email, password: email) { [weak self] user in
            guard let self = self else { return }
            guard user  else {
                self.view?.display(errorMessage: "register.label.backend.error.message".localized())
                return
            }
            self.view?.routeToDashboard()
        }
        
        
    }

}
