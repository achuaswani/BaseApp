//
//  ProfilePresenter.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

protocol ProfilePresenterToInteractorType: class {
    func present(errorMessage: Error)
}

protocol ProfilePresenterToRouterType: class {
    // TODO: Declare presentation methods
}

protocol ProfilePresenterToViewType: class {
     func start()
     func updateEmailId(email: String)
     func updatePassword(newPassword: String, confirmPassword: String)
     func updateDisplayName(displayName: String)
     func didUpdatedUserDetails()
}

class ProfilePresenter: ProfilePresenterToInteractorType, ProfilePresenterToRouterType, ProfilePresenterToViewType {

    // MARK: Properties

    weak var view: ProfileView?
    var router: ProfileRouter?
    var interactor: ProfileInteractor?
    var userData: UserDataEntity
    
    init(userData: UserDataEntity) {
        self.userData = userData
    }
    
    func start() {
        view?.displayUserDetails(with: userData)
    }
    
    func updateEmailId(email: String) {
        if email != userData.emailId {
            
        }
    }
    
    func updatePassword(newPassword: String, confirmPassword: String) {
        guard newPassword == confirmPassword else {
            view?.display(errorMessage: "register.label.confirm.password.error.message".localized())
            return
        }
        
        guard newPassword.count >= 8  else {
            view?.display(errorMessage: "login.label.password.validation.error.message".localized())
            return
        }
        self.interactor?.updatePassword(to: newPassword)
    }
    
    func updateDisplayName(displayName: String) {
        if displayName != userData.userName {
            interactor?.updateDisplayName(displayName: displayName)
        }
    }
    
    func updateProfilePicture(to url: String) {
        interactor?.updateProfilePicture(to: url)
    }
    
    func didUpdatedUserDetails() {
        view?.displaySuccessAlert()
    }
    
    func present(errorMessage: Error) {
        view?.display(errorMessage: errorMessage.localizedDescription)
    }
}
