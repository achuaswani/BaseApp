//RAS
//  LoginService.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol LoginServiceType {
    func loginUser(email: String, password: String, closure: @escaping (Bool?) ->())
}
class LoginService: LoginServiceType {
    func loginUser(email: String, password: String, closure: @escaping (Bool?) ->()) {
         FBAuth().loginUser(email: email,password: password, closure: closure)
    }
}
