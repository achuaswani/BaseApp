//RAS
//  RegisterInteractor.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterInteractorToPresenterType {
}
class RegisterInteractor: RegisterInteractorToPresenterType {
    var presenter: RegisterPresenter?
    var service: RegisterService?

}
