//RAS
//  LoginInteractor.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

public protocol LoginInteractorToPresenterType {
    func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->())
}
public class LoginInteractor: LoginInteractorToPresenterType {
    public var presenter: LoginPresenter?
    public var service: LoginService?
    public init() {}
    public func loginUser(email: String, password: String, closure: @escaping (UserDataEntity?, Error?) ->()) {
        service?.loginUser(email: email, password: password, closure: closure)
    }

}
