//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

protocol ___VARIABLE_ModuleName___PresenterToInteractorType: class {
    // TODO: Declare presentation methods
}

protocol ___VARIABLE_ModuleName___PresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol ___VARIABLE_ModuleName___PresenterToViewType: class {
    // TODO: Declare presentation methods
     func start()
}

class ___VARIABLE_ModuleName___Presenter: ___VARIABLE_ModuleName___PresenterToInteractorType, ___VARIABLE_ModuleName___PresenterToRouterType, ___VARIABLE_ModuleName___PresenterToViewType {

    // MARK: Properties

    weak var view: ___VARIABLE_ModuleName___View?
    var router: ___VARIABLE_ModuleName___Router?
    var interactor: ___VARIABLE_ModuleName___Interactor?
    
    func start() {

    }
}
