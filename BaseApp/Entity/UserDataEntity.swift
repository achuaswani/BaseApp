//
//  UserDataEntity.swift
//  BaseApp
//
//  Created by Aswani G on 5/11/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

class UserDataEntity {
    let userId: String
    let emailId: String
    let photoURL: String
    let userName: String
    
    init(userId: String,
         emailId: String,
         photoURL: String,
         userName: String) {
        self.userId = userId
        self.emailId = emailId
        self.photoURL = photoURL
        self.userName = userName
    }
}
