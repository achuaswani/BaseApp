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
    
    var imageview = UIImageView()

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
        
        imageview.image =  UIImage(named: "img")!
        imageview.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageview)
        
        headerLabel.text = "Login"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        style.style(label: headerLabel)
        scrollView.addSubview(headerLabel)

        emailTextField.placeholder = "Email Id"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.isSecureTextEntry = false
        emailTextField.delegate = self
        style.style(input: emailTextField)
        scrollView.addSubview(emailTextField)

        passwordField.placeholder = "Password"
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        style.style(input: passwordField)
        scrollView.addSubview(passwordField)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.accessibilityIdentifier = "loginButton"
        style.style(button: loginButton)
        scrollView.addSubview(loginButton)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.setTitle("Signup", for: .normal)
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        signupButton.accessibilityIdentifier = "signupButton"
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
            
            imageview.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: topSpacing),
            imageview.heightAnchor.constraint(equalToConstant: 300),
            imageview.widthAnchor.constraint(equalTo: margins.widthAnchor),
            imageview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: imageview.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: imageview.trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: generalSpacing),
            
            emailTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: generalSpacing),
            emailTextField.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            passwordField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: generalSpacing),
            passwordField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: generalSpacing),
            loginButton.leadingAnchor.constraint(equalTo: imageview.leadingAnchor),
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
