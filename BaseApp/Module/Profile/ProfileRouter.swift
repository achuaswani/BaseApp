//
//  ProfileRouter.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileRouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class ProfileRouter: ProfileRouterToPresenterType {

    // MARK: Properties
    typealias Presenter = ProfilePresenter
    typealias View =  ProfileView
    typealias Style = ProfileStyle
    typealias Router = ProfileRouter
    typealias Interactor = ProfileInteractor
    typealias Service = ProfileService

    static func createModule(with userdata: UserDataEntity) -> ProfileView {
        let viewController = View()
        let style = Style()
        let presenter = Presenter(userData: userdata)
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

