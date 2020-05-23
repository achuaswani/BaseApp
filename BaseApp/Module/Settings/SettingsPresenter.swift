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
    var settingsItems: [String] { get }
    func start()
    func logoutUser()
    func selectedRow(at index: Int)
}

class SettingsPresenter: SettingsPresenterToInteractorType, SettingsPresenterToRouterType, SettingsPresenterToViewType {
    // MARK: Properties

    weak var view: SettingsView?
    var router: SettingsRouter?
    var interactor: SettingsInteractor?
    var userData: UserDataEntity
    var settingsItems: [String] {
        return ["settings.list.item.profile".localized(),
                   "settings.list.item.about".localized(),
                   "settings.list.item.logout".localized()]
    }
    
    init(userData: UserDataEntity) {
        self.userData = userData
    }
    
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
    
    func selectedRow(at index: Int) {
        if settingsItems[index] == "settings.list.item.profile".localized() {
            view?.displayProfileScreen(with: userData)
        } else if settingsItems[index] == "settings.list.item.about".localized() {
            view?.displayAboutScreen()
        } else if settingsItems[index] == "settings.list.item.logout".localized() {
           logoutUser()
        }
    }
}
