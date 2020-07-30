//RAS
//  LoginService.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol LoginServiceType {
    func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->())
}
public class LoginService: LoginServiceType {
    public init() {}
    func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->()) {
        FBAuth().loginUser(email: email,password: password) { user, error in
            guard let user = user else {
                closure(nil, error)
              return
            }
            let userData = UserDataEntity(userId: user.providerID,
                            emailId: email,
                            photoURL: user.photoURL,
                            userName: user.displayName)
            closure(userData, nil)
            
        }
    }
}
