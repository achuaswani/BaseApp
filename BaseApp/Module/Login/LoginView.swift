//RAS
//  LoginView.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

public protocol LoginViewType {
    func routeToDashboard(with userData: UserDataEntity)
    func display(errorMessage: String)
}
open class LoginView: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    public var presenter: LoginPresenterToViewType?
    public var style: LoginStyleType!
    lazy var headerImageView = UIImageView(frame: .zero)
    lazy var headerLabel: UILabel = UILabel(frame: .zero)
    lazy var emailTextField: UITextField = UITextField(frame: .zero)
    lazy var passwordTextField: UITextField = UITextField(frame: .zero)
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var errorLabel: UILabel = UILabel(frame: .zero)
    lazy var loginButton: UIButton = UIButton(frame: .zero)
    lazy var registerButton: UIButton = UIButton(frame: .zero)
    private var isFieldsAreEmpty: Bool {
        errorLabel.text = ""
        guard let email = emailTextField.text,
            let password = passwordTextField.text,
            email != "", password != "" else {
                return true
        }
        presenter?.loginUser(email: email, password: password)
        return false
    }
    
    //public init() { super.init() }
    
    // MARK: Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    open override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(scrollView)
        view.accessibilityIdentifier = "loginView"
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        headerImageView.image =  UIImage(named: "login")!
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.accessibilityIdentifier = "headerImageView"
        scrollView.addSubview(headerImageView)
        
        headerLabel.text = "login.label.header.title".localized()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.accessibilityIdentifier = "headerLabel"
        style.baseStyle.style(title: headerLabel)
        scrollView.addSubview(headerLabel)

        emailTextField.placeholder = "login.textfield.emailid.title".localized()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.isSecureTextEntry = false
        emailTextField.delegate = self
        emailTextField.accessibilityIdentifier = "emailTextField"
        style.baseStyle.style(input: emailTextField)
        scrollView.addSubview(emailTextField)

        passwordTextField.placeholder = "login.textfield.password.title".localized()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.isAccessibilityElement = true
        passwordTextField.accessibilityIdentifier = "passwordTextField"
        style.baseStyle.style(input: passwordTextField)
        scrollView.addSubview(passwordTextField)
        
        errorLabel.text = ""
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.accessibilityIdentifier = "errorLabel"
        style.baseStyle.style(error: errorLabel)
        scrollView.addSubview(errorLabel)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("login.button.login.title".localized(), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.accessibilityIdentifier = "loginButton"
        style.baseStyle.style(button: loginButton)
        scrollView.addSubview(loginButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("login.button.register.title".localized(), for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.accessibilityIdentifier = "registerButton"
        style.baseStyle.style(buttonLink: registerButton)
        scrollView.addSubview(registerButton)
        
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
            
            headerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: topSpacing),
            headerImageView.heightAnchor.constraint(equalToConstant: 250),
            headerImageView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: generalSpacing),
            
            emailTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: generalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            errorLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            
            loginButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: generalSpacing),
            loginButton.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: generalSpacing),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
    }

    @objc private func loginButtonTapped() {
        if isFieldsAreEmpty {
            errorLabel.text = "login.label.generic.error.message".localized()
            return
        }
    }
    
    @objc private func registerButtonTapped() {
        let registerRouter = RegisterRouter.createModule()
        self.navigationController?.pushViewController(registerRouter,animated: true)
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

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard isFieldsAreEmpty else {
            dimissKeyboard()
            return true
        }
        passwordTextField.becomeFirstResponder()
        return false
    }
    
    private func dimissKeyboard(){
        self.view.endEditing(true)
    }
    
    open func routeToDashboard(with userData: UserDataEntity) {
        let dashboardRouter = DashboardRouter.createModule(with: userData)
        self.navigationController?.pushViewController(dashboardRouter,animated: true)
    }
}

extension LoginView: LoginViewType {
    
    
    public func display(errorMessage: String) {
        errorLabel.text = errorMessage
    }
}
