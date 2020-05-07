//
//  SignupPresenter.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol SignupPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol SignupPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol SignupPresenterToViewType: class {
    // TODO: Declare presentation methods
     func start()
}

class SignupPresenter: SignupPresenterToInteractorType, SignupPresenterToRouterType, SignupPresenterToViewType {

    // MARK: Properties

    weak var view: SignupView?
    var router: SignupRouter?
    var interactor: SignupInteractor?
    
    func start(){

    }
}
