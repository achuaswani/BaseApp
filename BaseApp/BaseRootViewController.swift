//
//  ViewController.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

open class BaseRootViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    open override func loadView() {

        view = UIView(frame: .zero)
        view.accessibilityIdentifier = "RootViewController"
        view.backgroundColor = .white
    }

    open override func viewWillAppear(_ animated: Bool) {
        if ProcessInfo.processInfo.arguments.contains("BaseAppUITest") {
            let loginRouter = LoginRouter.createModule()
            self.navigationController?.pushViewController(loginRouter,animated: false)
        } else {
            checkForUserLoggedIn()
        }
    }

    open override func viewDidDisappear(_ animated: Bool) {
        guard let authHandle = handle else { return }
        FBAuth().removeState(handle: authHandle)
    }
    
    func checkForUserLoggedIn() {
        FBAuth().checkForUserLoggedIn(handle: &handle) { user in
            if let user = user, let email = user.email {
                let userData = UserDataEntity(userId: user.providerID,
                                             emailId: email,
                                             photoURL: user.photoURL,
                                             userName: user.displayName)
                self.routeToDashboard(userData: userData)
                
            } else {
                self.routeToLogin()
            }
        }
    }
    
    open func routeToDashboard(userData: UserDataEntity) {
        let dashboardRouter = DashboardRouter.createModule(with: userData)
        self.navigationController?.pushViewController(dashboardRouter,animated: false)
    }
    
    open func routeToLogin() {
        let loginRouter = LoginRouter.createModule()
        self.navigationController?.pushViewController(loginRouter,animated: false)
    }
}
