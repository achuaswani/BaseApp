//RAS
//  DashboardView.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardViewType {
    func routeToLogin()
    func displayErrorPopup()
}
class DashboardView: UIViewController {

    // MARK: Properties

    var presenter: DashboardPresenterToViewType?
    var style: DashboardStyleType!
    lazy var logoutButton: UIButton = UIButton(frame: .zero)

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("login.button.signup.title".localized(), for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.accessibilityIdentifier = "signupButton"
        style.style(button: logoutButton)
        view.addSubview(logoutButton)
        addConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func addConstraints() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40)
        ])
    }
    
    @objc private func logoutButtonTapped() {
        presenter?.logoutUser()
    }
}

extension DashboardView: DashboardViewType {
    func routeToLogin() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func displayErrorPopup() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")

        }}))
        self.present(alert, animated: true, completion: nil)
    }
}
