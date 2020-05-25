//RAS
//  SettingsService.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol SettingsServiceType {
    func logout(closure: @escaping (Bool?) -> ())
}
class SettingsService: SettingsServiceType {
    func logout(closure: @escaping (Bool?) -> ()) {
        FBAuth().logout(closure: closure)
    }
}
