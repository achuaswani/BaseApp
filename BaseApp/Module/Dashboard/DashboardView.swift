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
        logoutButton.setTitle("dashboard.button.logout.title".localized(), for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.accessibilityIdentifier = "logout"
        let settingsButton = UIButton(type: .custom)
        settingsButton.setImage(UIImage(named: "icon-settings.png"), for: .normal)
        settingsButton.setTitleColor(settingsButton.tintColor, for: .normal)
        settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: settingsButton)
        style.style(button: logoutButton)
        view.addSubview(logoutButton)
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    @objc private func logoutButtonTapped() {
        presenter?.logoutUser()
    }
    
    
    @objc private func settingsTapped() {
        routeToSettings()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40)
        ])
    }
    
    private func routeToSettings() {
        let settingsRouter = SettingsRouter.createModule()
        self.navigationController?.pushViewController(settingsRouter,animated: true)
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
