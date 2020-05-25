//
//  AboutRouter.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol AboutRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class AboutRouter: AboutRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = AboutPresenter
    typealias View =  AboutView
    typealias Style = AboutStyle
    typealias Router = AboutRouter
    typealias Interactor = AboutInteractor
    typealias Service = AboutService

    static func createModule() -> AboutView {
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

