//
//  ViewController.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import UIKit
import Firebase

class RootViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    override func loadView() {

        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        FBAuth().checkForUserLoggedIn(handle: &handle) { user in
            if let user = user {
                let userData = UserDataEntity(userId: user.providerID,
                             emailId: user.email,
                             photoURL: user.photoURL,
                             userName: user.displayName)
                let dashboardRouter = DashboardRouter.createModule(with: userData )
                self.navigationController?.pushViewController(dashboardRouter,animated: false)
            } else {
               let loginRouter = LoginRouter.createModule()
               self.navigationController?.pushViewController(loginRouter,animated: false)
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        guard let authHandle = handle else { return }
        FBAuth().removeState(handle: authHandle)
    }
}
