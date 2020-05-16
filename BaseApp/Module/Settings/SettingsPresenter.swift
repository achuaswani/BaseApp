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
    // TODO: Declare presentation methods
     func start()
}

class SettingsPresenter: SettingsPresenterToInteractorType, SettingsPresenterToRouterType, SettingsPresenterToViewType {

    // MARK: Properties

    weak var view: SettingsView?
    var router: SettingsRouter?
    var interactor: SettingsInteractor?
    
    func start(){

    }
}
