//RAS
//  DashboardService.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol DashboardServiceType {
     func logout(closure: @escaping (Bool?) -> ())
}
class DashboardService: DashboardServiceType {
    func logout(closure: @escaping (Bool?) -> ()) {
        FBAuth().logout(closure: closure)
    }
}
