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
    
    func updateUserDetails(userName: String?, profilePicture: URL?, closure: @escaping (Error?) -> ()) {
        let changeRequest = firebaseAuth.currentUser?.createProfileChangeRequest()
        if userName != nil {
            changeRequest?.displayName = userName
        }
        if profilePicture != nil {
            changeRequest?.photoURL = profilePicture
        }

        changeRequest?.commitChanges { error in
            if error == nil {
                closure(nil)
            } else {
                closure(error)
            }
        }
    }
    
    func updateEmailId(to email: String, closure: @escaping (Error?) -> ()) {
        firebaseAuth.currentUser?.updateEmail(to: email) { error in
            closure(error)
        }
    }
    
    func updatePassword(to password: String, closure: @escaping (Error?) -> ()) {
        firebaseAuth.currentUser?.updatePassword(to: password) { error in
            closure(error)
        }
    }
    
    func reauthenticate(with email: String, password: String, closure: @escaping (Error?) -> ()) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        firebaseAuth.currentUser?.reauthenticate(with: credential, completion: { _, error in
            guard let error = error else {
                closure(nil)
                return
            }
            closure(error)
        })
    }
    
}
