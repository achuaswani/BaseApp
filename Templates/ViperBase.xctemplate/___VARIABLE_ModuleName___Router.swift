//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___RouterToPresenterType: class {
    // TODO: Declare wireframe methods
}
class ___VARIABLE_ModuleName___Router: ___VARIABLE_ModuleName___RouterToPresenterType {

    // MARK: Properties
    typealias Presenter = ___VARIABLE_ModuleName___Presenter
    typealias View =  ___VARIABLE_ModuleName___View
    typealias Style = ___VARIABLE_ModuleName___Style
    typealias Router = ___VARIABLE_ModuleName___Router
    typealias Interactor = ___VARIABLE_ModuleName___Interactor

    static func createModule() -> ___VARIABLE_ModuleName___View {
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

