//
//  LoginRouter.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class LoginRouter: LoginRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = LoginPresenter
    typealias View =  LoginView
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor

    static func createModule() -> LoginView {
        let viewController = View()
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return viewController
    }
}

