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
    func registerUser(email: String, password: String, closure: @escaping(Bool) -> ())
}
class RegisterInteractor: RegisterInteractorToPresenterType {
    var presenter: RegisterPresenter?
    var service: RegisterService?
    
    func registerUser(email: String, password: String, closure: @escaping(Bool) -> ()) {
        service?.registerUser(email: email, password: email, closure: closure)
    }

}
