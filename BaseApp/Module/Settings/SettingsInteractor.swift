//RAS
//  SettingsInteractor.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsInteractorToPresenterType {
    func logout(closure: @escaping (Bool?) -> ())
}
class SettingsInteractor: SettingsInteractorToPresenterType {
    var presenter: SettingsPresenter?
    var service:  SettingsService?
    
    func logout(closure: @escaping (Bool?) -> ()) {
        service?.logout(closure: closure)
    }
}
