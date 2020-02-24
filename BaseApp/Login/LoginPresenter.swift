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
    // TODO: Declare presentation methods
     func start()
}

class LoginPresenter: LoginPresenterToInteractorType, LoginPresenterToRouterType, LoginPresenterToViewType {

    // MARK: Properties

    weak var view: LoginView?
    var router: LoginRouter?
    var interactor: LoginInteractor?
    
    func start(){

    }
}
