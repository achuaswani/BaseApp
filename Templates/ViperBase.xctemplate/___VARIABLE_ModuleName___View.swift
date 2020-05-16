//RAS
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

protocol ___VARIABLE_ModuleName___ViewType {

}
class ___VARIABLE_ModuleName___View: UIViewController {

    // MARK: Properties

    var presenter: ___VARIABLE_ModuleName___PresenterToViewType?
    var style: ___VARIABLE_ModuleName___StyleType!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension ___VARIABLE_ModuleName___View: ___VARIABLE_ModuleName___ViewType {
    // TODO: implement view output methods
}
