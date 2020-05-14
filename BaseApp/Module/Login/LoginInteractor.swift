//RAS
//  LoginInteractor.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInteractorToPresenterType {
    func loginUser(email: String, password: String, closure: @escaping (Bool?) ->())
}
class LoginInteractor: LoginInteractorToPresenterType {
    var presenter: LoginPresenter?
    var service: LoginService?
    
    func loginUser(email: String, password: String, closure: @escaping (Bool?) ->()) {
        service?.loginUser(email: email, password: password, closure: closure)
        /*if let user = UserData {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
          var multiFactorString = "MultiFactor: "
          for info in user.multiFactor.enrolledFactors {
            multiFactorString += info.displayName ?? "[DispayName]"
            multiFactorString += " "
          }
        }*/
    }

}
