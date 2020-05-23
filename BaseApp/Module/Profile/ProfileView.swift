//RAS
//  ProfileView.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileViewType {
    func displayUserDetails(with userdata: UserDataEntity)
    func display(errorMessage: String)
    func displaySuccessAlert()

}
class ProfileView: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    var presenter: ProfilePresenterToViewType?
    var style: ProfileStyleType!
    
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var profileImageView = UIImageView(frame: .zero)
    
    lazy var errorLabel: UILabel = UILabel(frame: .zero)

    lazy var resetEmailIdLabel: UILabel = UILabel(frame: .zero)
    lazy var emailIdTextField: UITextField = UITextField(frame: .zero)
    lazy var updateEmailIdButton: UIButton = UIButton(frame: .zero)
    
    lazy var resetPasswordLabel: UILabel = UILabel(frame: .zero)
    lazy var currentPasswordField: UITextField = UITextField(frame: .zero)
    lazy var newPasswordField: UITextField = UITextField(frame: .zero)
    lazy var confirmPasswordField: UITextField = UITextField(frame: .zero)
    lazy var updatePasswordButton: UIButton = UIButton(frame: .zero)
    
    lazy var updateUserNameLabel: UILabel = UILabel(frame: .zero)
    lazy var userNameTextField: UITextField = UITextField(frame: .zero)
    lazy var updateUserNameButton: UIButton = UIButton(frame: .zero)
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.image =  UIImage(named: "profile")!
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.accessibilityIdentifier = "profileImageView"
        scrollView.addSubview(profileImageView)
        
        updateUserNameLabel.text = "profile.button.update.user.data.title".localized()
        updateUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        updateUserNameLabel.accessibilityIdentifier = "updateUserNameLabel"
        style.baseStyle.style(header1: updateUserNameLabel)
        scrollView.addSubview(updateUserNameLabel)
        
        userNameTextField.placeholder = "register.textfield.username.title".localized()
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.isSecureTextEntry = false
        userNameTextField.delegate = self
        userNameTextField.accessibilityIdentifier = "userNameTextField"
        style.baseStyle.style(input: userNameTextField)
        scrollView.addSubview(userNameTextField)

        updateUserNameButton.translatesAutoresizingMaskIntoConstraints = false
        updateUserNameButton.setTitle("profile.button.update.user.data.title".localized(), for: .normal)
        updateUserNameButton.addTarget(self, action: #selector(updateUserName), for: .touchUpInside)
        updateUserNameButton.accessibilityIdentifier = "updateProfile"
        style.baseStyle.style(button: updateUserNameButton)
        scrollView.addSubview(updateUserNameButton)
        
        resetEmailIdLabel.text = "profile.label.reset.emailid.title".localized()
        resetEmailIdLabel.translatesAutoresizingMaskIntoConstraints = false
        resetEmailIdLabel.accessibilityIdentifier = "resetEmailIdLabel"
        style.baseStyle.style(header1: resetEmailIdLabel)
        scrollView.addSubview(resetEmailIdLabel)
        
        emailIdTextField.translatesAutoresizingMaskIntoConstraints = false
        emailIdTextField.accessibilityIdentifier = "emailIdTextField"
        style.baseStyle.style(input: emailIdTextField)
        emailIdTextField.isSecureTextEntry = false
        emailIdTextField.delegate = self
        scrollView.addSubview(emailIdTextField)
        
        currentPasswordField.placeholder = "profile.textfield.current.password.title".localized()
        currentPasswordField.translatesAutoresizingMaskIntoConstraints = false
        currentPasswordField.isSecureTextEntry = true
        currentPasswordField.delegate = self
        currentPasswordField.accessibilityIdentifier = "currentPasswordField"
        style.baseStyle.style(input: currentPasswordField)
        scrollView.addSubview(currentPasswordField)
        
        updateEmailIdButton.translatesAutoresizingMaskIntoConstraints = false
        updateEmailIdButton.setTitle("profile.button.update.user.data.title".localized(), for: .normal)
        updateEmailIdButton.addTarget(self, action: #selector(updateEmailId), for: .touchUpInside)
        updateEmailIdButton.accessibilityIdentifier = "updateProfile"
        style.baseStyle.style(button: updateEmailIdButton)
        scrollView.addSubview(updateEmailIdButton)

        resetPasswordLabel.text = "profile.label.reset.password.title".localized()
        resetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordLabel.accessibilityIdentifier = "resetPasswordLabel"
        style.baseStyle.style(header1: resetPasswordLabel)
        scrollView.addSubview(resetPasswordLabel)
        
        newPasswordField.placeholder = "profile.textfield.new.password.title".localized()
        newPasswordField.translatesAutoresizingMaskIntoConstraints = false
        newPasswordField.isSecureTextEntry = true
        newPasswordField.delegate = self
        newPasswordField.accessibilityIdentifier = "passwordField"
        style.baseStyle.style(input: newPasswordField)
        scrollView.addSubview(newPasswordField)
        
        confirmPasswordField.placeholder = "register.textfield.confirm.password.title".localized()
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.isSecureTextEntry = true
        confirmPasswordField.delegate = self
        confirmPasswordField.accessibilityIdentifier = "confirmPasswordField"
        style.baseStyle.style(input: confirmPasswordField)
        scrollView.addSubview(confirmPasswordField)
        
        errorLabel.text = ""
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.accessibilityIdentifier = "errorLabel"
        style.baseStyle.style(error: errorLabel)
        scrollView.addSubview(errorLabel)
        
        updatePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        updatePasswordButton.setTitle("profile.button.update.user.data.title".localized(), for: .normal)
        updatePasswordButton.addTarget(self, action: #selector(updatePassword), for: .touchUpInside)
        updatePasswordButton.accessibilityIdentifier = "updateProfile"
        style.baseStyle.style(button: updatePasswordButton)
        scrollView.addSubview(updatePasswordButton)
        
        setupLayout()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        let topSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 20 : 30
        let generalSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 20 : 40
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: topSpacing),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.centerXAnchor.constraint(lessThanOrEqualTo: margins.centerXAnchor),
            
            updateUserNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            updateUserNameLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            updateUserNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
           
            userNameTextField.topAnchor.constraint(equalTo: updateUserNameLabel.bottomAnchor, constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: updateUserNameLabel.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: updateUserNameLabel.trailingAnchor),
           
            updateUserNameButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10),
            updateUserNameButton.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            updateUserNameButton.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            
            resetEmailIdLabel.leadingAnchor.constraint(equalTo: updateUserNameButton.leadingAnchor),
            resetEmailIdLabel.trailingAnchor.constraint(equalTo: updateUserNameButton.trailingAnchor),
            resetEmailIdLabel.topAnchor.constraint(equalTo: updateUserNameButton.bottomAnchor, constant: 10),
            
            emailIdTextField.leadingAnchor.constraint(equalTo: resetEmailIdLabel.leadingAnchor),
            emailIdTextField.trailingAnchor.constraint(equalTo: resetEmailIdLabel.trailingAnchor),
            emailIdTextField.topAnchor.constraint(equalTo: resetEmailIdLabel.bottomAnchor, constant: 10),
            
            currentPasswordField.leadingAnchor.constraint(equalTo: emailIdTextField.leadingAnchor),
            currentPasswordField.trailingAnchor.constraint(equalTo: emailIdTextField.trailingAnchor),
            currentPasswordField.topAnchor.constraint(equalTo: emailIdTextField.bottomAnchor, constant: 10),
            
            updateEmailIdButton.topAnchor.constraint(equalTo: currentPasswordField.bottomAnchor, constant: 10),
            updateEmailIdButton.leadingAnchor.constraint(equalTo: currentPasswordField.leadingAnchor),
            updateEmailIdButton.trailingAnchor.constraint(equalTo: currentPasswordField.trailingAnchor),
            
            resetPasswordLabel.leadingAnchor.constraint(equalTo: updateEmailIdButton.leadingAnchor),
            resetPasswordLabel.trailingAnchor.constraint(equalTo: updateEmailIdButton.trailingAnchor),
            resetPasswordLabel.topAnchor.constraint(equalTo: updateEmailIdButton.bottomAnchor, constant: 10),
            
            newPasswordField.topAnchor.constraint(equalTo: resetPasswordLabel.bottomAnchor, constant: 10),
            newPasswordField.leadingAnchor.constraint(equalTo: resetPasswordLabel.leadingAnchor),
            newPasswordField.trailingAnchor.constraint(equalTo: resetPasswordLabel.trailingAnchor),
            
            confirmPasswordField.topAnchor.constraint(equalTo: newPasswordField.bottomAnchor, constant: 10),
            confirmPasswordField.leadingAnchor.constraint(equalTo: newPasswordField.leadingAnchor),
            confirmPasswordField.trailingAnchor.constraint(equalTo: newPasswordField.trailingAnchor),
            
            errorLabel.leadingAnchor.constraint(equalTo: confirmPasswordField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: confirmPasswordField.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: generalSpacing),
            
            updatePasswordButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 10),
            updatePasswordButton.leadingAnchor.constraint(equalTo: confirmPasswordField.leadingAnchor),
            updatePasswordButton.trailingAnchor.constraint(equalTo: confirmPasswordField.trailingAnchor)
        ])
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc private func updateEmailId() {
        guard let emailId = emailIdTextField.text else {
            return
        }
        presenter?.updateEmailId(email: emailId)
    }
    
    @objc private func updatePassword() {
        errorLabel.text = ""
        if let newPassword = newPasswordField.text,
            let confirmPassword = confirmPasswordField.text,
             newPassword != "", confirmPassword != ""  {
            presenter?.updatePassword(newPassword: newPassword,
                                      confirmPassword: confirmPassword)
        } else {
            errorLabel.text = "login.label.generic.error.message".localized()
        }
    }
    
    @objc private func updateUserName() {
        guard let userName = userNameTextField.text else {
            return
        }
        presenter?.updateDisplayName(displayName: userName)
    }
    
    @objc private func updateProfilePicture() {
        guard let userName = userNameTextField.text else {
            return
        }
        presenter?.updateDisplayName(displayName: userName)
    }
   
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       dimissKeyboard()
       return false
    }
    
    private func dimissKeyboard(){
        self.view.endEditing(true)
    }
    
}

extension ProfileView: ProfileViewType {
    func displayUserDetails(with userdata: UserDataEntity) {
        emailIdTextField.text = userdata.emailId
        userNameTextField.text = userdata.userName ?? ""
    }
    
    func display(errorMessage: String) {
        errorLabel.text = errorMessage
    }
    
    func displaySuccessAlert() {
        let alert = UIAlertController(title: "Succfully updated user details.", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
            }
          )
        )
        self.present(alert, animated: true, completion: nil)
    }
}
