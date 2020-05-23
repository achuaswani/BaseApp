//RAS
//  RegisterService.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol RegisterServiceType {
    func registerUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) -> ())
    func updateUserDetails(userName: String?, profilePicture: URL?, closure: @escaping (Error?) -> ())
}
class RegisterService: RegisterServiceType {
    func registerUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) -> ()) {
        FBAuth().registerUser(email: email, password: password) { user, error in
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
    
    func updateUserDetails(userName: String?, profilePicture: URL?, closure: @escaping (Error?) -> ()) {
        FBAuth().updateUserDetails(userName: userName, profilePicture: profilePicture, closure: closure)
    }
}
