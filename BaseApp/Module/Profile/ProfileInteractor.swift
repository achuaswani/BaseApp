//RAS
//  ProfileInteractor.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileInteractorToPresenterType {
    func reAuthenticate(email: String, password: String, closure: @escaping (Error?) ->())
    func updateProfilePicture(to url: String)
    func updateEmailId(email: String)
    func updatePassword(to password: String)
    func updateDisplayName(displayName: String)
}
class ProfileInteractor: ProfileInteractorToPresenterType {
    var presenter: ProfilePresenter?
    var service:  ProfileService?
    
    func reAuthenticate(email: String, password: String, closure: @escaping (Error?) ->()) {
        service?.loginUser(email: email, password: password, closure: closure)
    }
    
    func updateProfilePicture(to url: String) {
        service?.updateProfilePicture(to: url) { _ in
            
        }
    }
    
    func updateEmailId(email: String) {
        service?.updateEmailId(to: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.present(errorMessage: error)
            }
        }
    }
    
    func updatePassword(to password: String) {
        service?.updatePassword(to: password) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.present(errorMessage: error)
            }
        }
    }
    
    func updateDisplayName(displayName: String) {
        service?.updateDisplayName(displayName: displayName) { [weak self] (error) in
            guard let self = self, let presenter = self.presenter else { return }
            guard let error = error else {
                presenter.didUpdatedUserDetails()
                return
            }
            presenter.present(errorMessage: error)
        }
    }
    
}
