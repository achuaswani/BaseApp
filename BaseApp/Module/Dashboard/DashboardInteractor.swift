//RAS
//  DashboardInteractor.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardInteractorToPresenterType {
     func logout(closure: @escaping (Bool?) -> ())
}
class DashboardInteractor: DashboardInteractorToPresenterType {
    var presenter: DashboardPresenter?
    var service: DashboardService?
    
    func logout(closure: @escaping (Bool?) -> ()) {
        service?.logout(closure: closure)
    }

}
