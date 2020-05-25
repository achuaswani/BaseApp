//
//  DashboardPresenter.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol DashboardPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol DashboardPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol DashboardPresenterToViewType: class {
    func start()
    var userData: UserDataEntity { get }
}

class DashboardPresenter: DashboardPresenterToInteractorType, DashboardPresenterToRouterType, DashboardPresenterToViewType {

    // MARK: Properties

    weak var view: DashboardView?
    var router: DashboardRouter?
    var interactor: DashboardInteractor?
    var userData: UserDataEntity
    init(userData: UserDataEntity) {
        self.userData = userData
    }
    func start() {
        var welcomeText = "dashboard.header.welcome.title".localized()
        if let displayName = userData.userName {
            welcomeText = "\(welcomeText) \(displayName)"
        }
        view?.display(title: welcomeText)
    }
}
