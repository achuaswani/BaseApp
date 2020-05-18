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
    func display(title: String)
}
class DashboardView: UIViewController {

    // MARK: Properties

    var presenter: DashboardPresenterToViewType?
    var style: DashboardStyleType!
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var headerLabel: UILabel = UILabel(frame: .zero)

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
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.accessibilityIdentifier = "headerLabel"
        style.baseStyle.style(title: headerLabel)
        scrollView.addSubview(headerLabel)
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
    func display(title: String) {
        
    }
}
