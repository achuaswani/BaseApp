//
//  SignupRouter.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SignupRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class SignupRouter: SignupRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = SignupPresenter
    typealias View =  SignupView
    typealias Style = SignupStyle
    typealias Router = SignupRouter
    typealias Interactor = SignupInteractor

    static func createModule() -> SignupView {
        let viewController = View()
        let style = Style()
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor()

        viewController.presenter =  presenter
        viewController.style = style

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return viewController
    }
}

