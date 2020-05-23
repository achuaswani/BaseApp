//
//  AboutPresenter.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol AboutPresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol AboutPresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol AboutPresenterToViewType: class {
    // TODO: Declare presentation methods
     func start()
}

class AboutPresenter: AboutPresenterToInteractorType, AboutPresenterToRouterType, AboutPresenterToViewType {

    // MARK: Properties

    weak var view: AboutView?
    var router: AboutRouter?
    var interactor: AboutInteractor?
    
    func start(){

    }
}
