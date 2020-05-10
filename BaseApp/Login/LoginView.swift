//RAS
//  LoginView.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit
import Crashlytics

protocol LoginViewType {

}
class LoginView: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    var presenter: LoginPresenterToViewType?
    var style: LoginStyleType!
    lazy var headerLabel: UILabel = UILabel(frame: .zero)
    lazy var emailTextField: UITextField = UITextField(frame: .zero)
    lazy var passwordField: UITextField = UITextField(frame: .zero)
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var loginButton: UIButton = UIButton(frame: .zero)
    lazy var signupButton: UIButton = UIButton(frame: .zero)
    
    var headerImageView = UIImageView()

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
        
        headerLabel.text = "login.button.header.title".localized()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.accessibilityIdentifier = "headerLabel"
        style.style(label: headerLabel)
        scrollView.addSubview(headerLabel)

        emailTextField.placeholder = "login.button.emailid.title".localized()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.isSecureTextEntry = false
        emailTextField.delegate = self
        emailTextField.accessibilityIdentifier = "emailTextField"
        style.style(input: emailTextField)
        scrollView.addSubview(emailTextField)

        passwordField.placeholder = "login.button.password.title".localized()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        passwordField.accessibilityIdentifier = "passwordField"
        style.style(input: passwordField)
        scrollView.addSubview(passwordField)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("login.button.signin.title".localized(), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.accessibilityIdentifier = "loginButton"
        style.style(button: loginButton)
        scrollView.addSubview(loginButton)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setTitle("login.button.signup.title".localized(), for: .normal)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        signupButton.accessibilityIdentifier = "signupButton"
        style.style(buttonLink: signupButton)
        scrollView.addSubview(signupButton)
        
        addConstraints()
    }

    func addConstraints() {
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
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: generalSpacing),
            loginButton.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: generalSpacing),
            signupButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signupButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
    }

    @objc private func loginButtonTapped() {
        let dashboardRouter = DashboardRouter.createModule()
        self.navigationController?.pushViewController(dashboardRouter,animated: true)
    }
    
    @objc private func signupButtonTapped() {
        let signupRouter = SignupRouter.createModule()
        self.navigationController?.pushViewController(signupRouter,animated: true)
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
    // TODO: implement view output methods
}
