//
//  SettingsPresenter.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol SettingsPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol SettingsPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol SettingsPresenterToViewType: class {
    func start()
    func logoutUser()
}

class SettingsPresenter: SettingsPresenterToInteractorType, SettingsPresenterToRouterType, SettingsPresenterToViewType {

    // MARK: Properties

    weak var view: SettingsView?
    var router: SettingsRouter?
    var interactor: SettingsInteractor?
    
    func start(){

    }
    
    func logoutUser() {
        interactor?.logout(){ [weak self] isLogout in
            guard let self = self else { return }
            guard let logout = isLogout, logout == true else {
                self.view?.displayErrorPopup()
                return
            }
            self.view?.routeToLogin()
        }
    }
}
