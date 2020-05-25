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
    func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->())
}
class LoginInteractor: LoginInteractorToPresenterType {
    var presenter: LoginPresenter?
    var service: LoginService?
    
    func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->()) {
        service?.loginUser(email: email, password: password, closure: closure)
    }

}
