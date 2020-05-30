//RAS
//  RegisterView.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterViewType {
    func display(errorMessage: String)
    func routeToDashboard(with userData: UserDataEntity)
}
class RegisterView: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    var presenter: RegisterPresenterToViewType?
    var style: RegisterStyleType!
    lazy var headerImageView = UIImageView(frame: .zero)
    lazy var headerLabel: UILabel = UILabel(frame: .zero)
    lazy var emailTextField: UITextField = UITextField(frame: .zero)
    lazy var passwordField: UITextField = UITextField(frame: .zero)
    lazy var confirmPasswordField: UITextField = UITextField(frame: .zero)
    lazy var userNameTextField: UITextField = UITextField(frame: .zero)
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var errorLabel: UILabel = UILabel(frame: .zero)
    lazy var registerButton: UIButton = UIButton(frame: .zero)
    private var isFieldsAreEmpty: Bool {
        errorLabel.text = ""
        guard let email = emailTextField.text,
            let password = passwordField.text,
            let confirmPassword = confirmPasswordField.text,
            checkNotEmpty(value: email), checkNotEmpty(value:password),
            checkNotEmpty(value: confirmPassword) else {
                return true
        }
        presenter?.registerUser(email: email,
                                password: password,
                                confirmPassword: confirmPassword,
                                userName: userNameTextField.text)
        return false
    }
    
    public func checkNotEmpty(value: String) -> Bool {
        if value == "" {
            return false
        }
        return true
    }
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
        self.emailTextField.delegate = self
        self.passwordField.delegate = self
        self.confirmPasswordField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.accessibilityIdentifier = "register"
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        headerImageView.image =  UIImage(named: "login")!
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.accessibilityIdentifier = "headerImageView"
        scrollView.addSubview(headerImageView)
        
        headerLabel.text = "register.label.header.title".localized()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.accessibilityIdentifier = "registerLabel"
        style.baseStyle.style(title: headerLabel)
        scrollView.addSubview(headerLabel)

        emailTextField.placeholder = "login.textfield.emailid.title".localized()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.isSecureTextEntry = false
        emailTextField.delegate = self
        emailTextField.accessibilityIdentifier = "emailTextField"
        style.baseStyle.style(input: emailTextField)
        scrollView.addSubview(emailTextField)
        
        passwordField.placeholder = "login.textfield.password.title".localized()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        passwordField.accessibilityIdentifier = "passwordField"
        style.baseStyle.style(input: passwordField)
        scrollView.addSubview(passwordField)
        
        confirmPasswordField.placeholder = "register.textfield.confirm.password.title".localized()
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.isSecureTextEntry = true
        confirmPasswordField.delegate = self
        confirmPasswordField.accessibilityIdentifier = "confirmPasswordField"
        style.baseStyle.style(input: confirmPasswordField)
        scrollView.addSubview(confirmPasswordField)
        
        userNameTextField.placeholder = "register.textfield.username.title".localized()
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.isSecureTextEntry = false
        userNameTextField.delegate = self
        userNameTextField.accessibilityIdentifier = "userNameTextField"
        style.baseStyle.style(input: userNameTextField)
        scrollView.addSubview(userNameTextField)
        
        errorLabel.text = ""
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.accessibilityIdentifier = "errorLabel"
        style.baseStyle.style(error: errorLabel)
        scrollView.addSubview(errorLabel)

        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("login.button.register.title".localized(), for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.accessibilityIdentifier = "registerButton"
        style.baseStyle.style(button: registerButton)
        scrollView.addSubview(registerButton)
    
        setupLayout()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        let topSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 10 : 20
        let generalSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 5 : 10
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            headerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 5),
            headerImageView.heightAnchor.constraint(equalToConstant: 250),
            headerImageView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: topSpacing),
            
            emailTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: generalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            passwordField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: generalSpacing),
            passwordField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: generalSpacing),
            confirmPasswordField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            confirmPasswordField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: generalSpacing),
            userNameTextField.leadingAnchor.constraint(equalTo: confirmPasswordField.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: confirmPasswordField.trailingAnchor),
            
            errorLabel.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 5),
            
            registerButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 5),
            registerButton.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor),
            
        ])
    }
    
    @objc private func registerButtonTapped() {
        guard isFieldsAreEmpty else {
            return
        }
        errorLabel.text = "login.label.generic.error.message".localized()
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

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard isFieldsAreEmpty else {
            dimissKeyboard()
            return true
        }
        if emailTextField.text == "" {
            emailTextField.becomeFirstResponder()
            return false
        }
        if passwordField.text == "" {
            passwordField.becomeFirstResponder()
            return false
        }
        confirmPasswordField.becomeFirstResponder()
        return false
    }
    
    private func dimissKeyboard(){
        self.view.endEditing(true)
    }
}

extension RegisterView: RegisterViewType {
    func routeToDashboard(with userData: UserDataEntity) {
        let dashboard = DashboardRouter.createModule(with: userData)
        self.navigationController?.pushViewController(dashboard,animated: true)
    }
    
    func display(errorMessage: String) {
        errorLabel.text = errorMessage
    }
}
