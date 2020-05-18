//
//  UserDataEntity.swift
//  BaseApp
//
//  Created by Aswani G on 5/11/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

class UserDataEntity {
    let userId: String?
    let emailId: String?
    let photoURL: URL?
    let userName: String?
    
    init(userId: String?,
         emailId: String?,
         photoURL: URL?,
         userName: String?) {
        self.userId = userId
        self.emailId = emailId
        self.photoURL = photoURL
        self.userName = userName
    }
}
