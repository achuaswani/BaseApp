//
//  SettingsRouter.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class SettingsRouter: SettingsRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = SettingsPresenter
    typealias View =  SettingsView
    typealias Style = SettingsStyle
    typealias Router = SettingsRouter
    typealias Interactor = SettingsInteractor
    typealias Service = SettingsService

    static func createModule() -> SettingsView {
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

