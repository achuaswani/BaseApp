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
    
    @objc private func settingsTapped() {
        routeToSettings()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
        ])
    }
    
    private func routeToSettings() {
        let settingsRouter = SettingsRouter.createModule()
        self.navigationController?.pushViewController(settingsRouter,animated: true)
    }
}

extension DashboardView: DashboardViewType {
   
}
