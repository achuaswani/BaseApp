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
class LoginView: UIViewController {

    // MARK: Properties

    var presenter: LoginPresenterToViewType?
    var style: LoginStyleType!
    lazy var lblHeader: UILabel = UILabel(frame: .zero)
    lazy var txtEmail: UITextField = UITextField(frame: .zero)
    lazy var txtPassword: UITextField = UITextField(frame: .zero)
    lazy var detailContainerView = UIView(frame: .zero)
    lazy var button: UIButton = UIButton(frame: .zero)

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        detailContainerView.translatesAutoresizingMaskIntoConstraints = false
        detailContainerView.backgroundColor = .red
        view.addSubview(detailContainerView)
        lblHeader.text = "Login"
        lblHeader.translatesAutoresizingMaskIntoConstraints = false
        lblHeader.textAlignment = .center
        lblHeader.numberOfLines = 1
        detailContainerView.addSubview(lblHeader)

        txtEmail.placeholder = "Email Id"
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        txtEmail.textAlignment = .left
        txtEmail.backgroundColor = .clear
        txtEmail.autocorrectionType = .no
        txtEmail.autocapitalizationType = .none
        txtEmail.isSecureTextEntry = false
        detailContainerView.addSubview(txtEmail)

        txtPassword.placeholder = "Password"
        txtPassword.translatesAutoresizingMaskIntoConstraints = false
        txtPassword.textAlignment = .center
        detailContainerView.addSubview(txtPassword)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.accessibilityIdentifier = "loginButton"
        button.backgroundColor = .black
        detailContainerView.addSubview(button)
        addConstraints()
    }

    func addConstraints() {
        detailContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        NSLayoutConstraint.activate([
            lblHeader.leftAnchor.constraint(equalTo: detailContainerView.leftAnchor),
            lblHeader.topAnchor.constraint(equalTo: detailContainerView.safeAreaLayoutGuide.topAnchor),
            txtEmail.leftAnchor.constraint(equalTo: detailContainerView.leftAnchor),
            txtEmail.topAnchor.constraint(equalTo: lblHeader.bottomAnchor, constant: 20),
            txtPassword.leftAnchor.constraint(equalTo: detailContainerView.leftAnchor),
            txtPassword.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: 20),
            button.leftAnchor.constraint(equalTo: detailContainerView.leftAnchor),
            button.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 20)
        ])
    }

    @objc private func buttonTapped(){

    }


    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension LoginView: LoginViewType {
    // TODO: implement view output methods
}
