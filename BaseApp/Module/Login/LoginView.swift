//RAS
//  LoginView.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewType {
    func routeToDashboard()
    func display(errorMessage: String)
}
class LoginView: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    var presenter: LoginPresenterToViewType?
    var style: LoginStyleType!
    lazy var headerImageView = UIImageView(frame: .zero)
    lazy var headerLabel: UILabel = UILabel(frame: .zero)
    lazy var emailTextField: UITextField = UITextField(frame: .zero)
    lazy var passwordField: UITextField = UITextField(frame: .zero)
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var errorLabel: UILabel = UILabel(frame: .zero)
    lazy var loginButton: UIButton = UIButton(frame: .zero)
    lazy var registerButton: UIButton = UIButton(frame: .zero)
    
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(scrollView)
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

        passwordField.placeholder = "login.textfield.password.title".localized()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        passwordField.accessibilityIdentifier = "passwordField"
        style.baseStyle.style(input: passwordField)
        scrollView.addSubview(passwordField)
        
        errorLabel.text = ""
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.accessibilityIdentifier = "headerLabel"
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
        registerButton.accessibilityIdentifier = "signupButton"
        style.baseStyle.style(buttonLink: registerButton)
        scrollView.addSubview(registerButton)
        
        addConstraints()
    }

    private func addConstraints() {
        let margins = view.layoutMarginsGuide
        let topSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 20 : 30
        let generalSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 20 : 40
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            
            headerImageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: topSpacing),
            headerImageView.heightAnchor.constraint(equalToConstant: 300),
            headerImageView.widthAnchor.constraint(equalTo: margins.widthAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: headerImageView.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: headerImageView.trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: generalSpacing),
            
            emailTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: generalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            passwordField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            errorLabel.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 5),
            
            loginButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: generalSpacing),
            loginButton.leadingAnchor.constraint(equalTo: errorLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: errorLabel.trailingAnchor),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: generalSpacing),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
    }

    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text,
            let password = passwordField.text,
            email != "", password != "" else {
            errorLabel.text = "login.label.generic.error.message".localized()
            return
        }
        presenter?.loginUser(email: email, password: password)
    }
    
    @objc private func registerButtonTapped() {
        let registerRouter = RegisterRouter.createModule()
        self.navigationController?.pushViewController(registerRouter,animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        //self.view.endEditing(true)
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
}

extension LoginView: LoginViewType {
    func routeToDashboard() {
        let dashboardRouter = DashboardRouter.createModule()
        self.navigationController?.pushViewController(dashboardRouter,animated: true)
    }
    
    func display(errorMessage: String) {
        errorLabel.text = errorMessage
    }
}
