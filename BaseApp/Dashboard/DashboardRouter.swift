//
//  DashboardRouter.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class DashboardRouter: DashboardRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = DashboardPresenter
    typealias View =  DashboardView
    typealias Style = DashboardStyle
    typealias Router = DashboardRouter
    typealias Interactor = DashboardInteractor

    static func createModule() -> DashboardView {
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

