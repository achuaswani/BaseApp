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
    func checkForUSerLoggedIn(handle: inout AuthStateDidChangeListenerHandle?, closure: @escaping (Bool) -> ()) {
        handle = firebaseAuth.addStateDidChangeListener { (auth, user) in
            if user == nil {
                closure(false)
            } else {
                closure(true)
            }
        }
    }
    
    func removeState(handle: AuthStateDidChangeListenerHandle) {
        firebaseAuth.removeStateDidChangeListener(handle)
    }
    
    func registerUser(email: String, password: String, closure: @escaping (Bool) -> ()){
        firebaseAuth.createUser(withEmail: email, password: password) { authResult, error in
            if let _ = authResult {
                closure(true)
            } else if let _ = error {
                closure(false)
            } else {
                closure(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, closure: @escaping (Bool) -> ()) {
        firebaseAuth.signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                closure(true)
            } else if error != nil {
                closure(false)
            } else {
                closure(false)
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
