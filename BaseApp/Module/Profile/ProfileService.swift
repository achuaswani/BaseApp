//RAS
//  ProfileService.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol ProfileServiceType {
    func loginUser(email: String, password: String, closure: @escaping (Error?) ->())
    func updateProfilePicture(to url: String, closure: @escaping (Error?) -> ())
    func updateEmailId(to email: String, closure: @escaping (Error?) -> ())
    func updatePassword(to password: String, closure: @escaping (Error?) -> ())
    func updateDisplayName(displayName: String?, closure: @escaping (Error?) -> ())
}
class ProfileService: ProfileServiceType {
    func loginUser(email: String, password: String, closure: @escaping (Error?) ->()) {
        FBAuth().loginUser(email: email,password: password) { user, error in
            guard user != nil else {
                closure(error)
              return
            }
            closure(nil)
            
        }
    }
    
    func updateProfilePicture(to url: String, closure: @escaping (Error?) -> ()) {
        FBAuth().updateUserDetails(userName: nil, profilePicture: nil, closure: closure)
    }
    
    func updateEmailId(to email: String, closure: @escaping (Error?) -> ()) {
         FBAuth().updateEmailId(to: email, closure: closure)
    }
    
    func updatePassword(to password: String, closure: @escaping (Error?) -> ()) {
        FBAuth().updatePassword(to: password, closure: closure)
    }
    
    func updateDisplayName(displayName: String?, closure: @escaping (Error?) -> ()) {
        FBAuth().updateUserDetails(userName: displayName, profilePicture: nil, closure: closure)
    }
    
    func reAuthenticate(email: String, password: String, closure: @escaping (Error?) -> ()) {
        FBAuth().reauthenticate(with: email, password: password, closure: closure)
    }
}
