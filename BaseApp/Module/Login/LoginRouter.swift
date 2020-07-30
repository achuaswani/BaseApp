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
open class LoginRouter: LoginRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = LoginPresenter
    typealias View =  LoginView
    typealias Style  = LoginStyle
    typealias Router = LoginRouter
    typealias Interactor = LoginInteractor
    typealias Service = LoginService

    static func createModule() -> LoginView {
        let viewController = View()
        let style = Style()
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor()
        let service = Service()

        viewController.presenter =  presenter
        viewController.style = style

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service

        return viewController
    }
}

