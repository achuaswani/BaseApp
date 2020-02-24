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
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                let loginRouter = LoginRouter.createModule()
                self.navigationController?.pushViewController(loginRouter,animated: true)
            } else {
                let dashboardRouter = DashboardRouter.createModule()
                self.navigationController?.pushViewController(dashboardRouter,animated: true)
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
