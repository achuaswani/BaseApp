//
//  RegisterRouter.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class RegisterRouter: RegisterRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = RegisterPresenter
    typealias View =  RegisterView
    typealias Style = RegisterStyle
    typealias Router = RegisterRouter
    typealias Interactor = RegisterInteractor
    typealias Service = RegisterService

    static func createModule() -> RegisterView {
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

