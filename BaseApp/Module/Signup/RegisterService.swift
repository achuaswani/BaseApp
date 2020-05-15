//RAS
//  RegisterService.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol RegisterServiceType {
    func registerUser(email: String, password: String, closure: @escaping(Bool) -> ())
}
class RegisterService: RegisterServiceType {
    func registerUser(email: String, password: String, closure: @escaping(Bool) -> ()) {
        FBAuth().registerUser(email: email, password: password, closure: closure)
    }
}
