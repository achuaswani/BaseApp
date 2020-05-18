//
//  FirebaseManager.swift
//  BaseApp
//
//  Created by Aswani G on 5/10/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import Firebase

class FBAuth {
    let firebaseAuth = Auth.auth()
    func checkForUserLoggedIn(handle: inout AuthStateDidChangeListenerHandle?, closure: @escaping (User?) -> ()) {
        handle = firebaseAuth.addStateDidChangeListener { (auth, user) in
            guard let user = user else {
                closure(nil)
                return
            }
            closure(user)
        }
    }
    
    func removeState(handle: AuthStateDidChangeListenerHandle) {
        firebaseAuth.removeStateDidChangeListener(handle)
    }
    
    func registerUser(email: String, password: String, closure: @escaping (User?, Error?) -> ()){
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if let result = authResult {
                closure(result.user, nil)
            } else if let error = error {
                closure(nil, error)
            } else {
                closure(nil, nil)
            }
        }
    }
    
    func loginUser(email: String, password: String, closure: @escaping (User?, Error?) -> ()) {
        firebaseAuth.signIn(withEmail: email, password: password) { authResult, error in
            if let result = authResult {
                closure(result.user, nil)
            } else if error != nil {
                closure(nil, error)
            } else {
                closure(nil, nil)
            }
            
        }
    }
    
    func logout(closure: @escaping (Bool?) -> ()) {
        do {
            try firebaseAuth.signOut()
            closure(true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            closure(false)
        }
    }
    
}
