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
}
class SettingsInteractor: SettingsInteractorToPresenterType {
    var presenter: SettingsPresenter?
    var service:  SettingsService?
}
