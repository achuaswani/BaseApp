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
open class DashboardView: UIViewController {

    // MARK: Properties

    var presenter: DashboardPresenterToViewType?
    var style: DashboardStyleType!
    lazy var scrollView = UIScrollView(frame: .zero)
    lazy var headerLabel: UILabel = UILabel(frame: .zero)

    // MARK: Lifecycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    open override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.accessibilityIdentifier = "dashboard"
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

    open override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    @objc private func settingsTapped() {
        routeToSettings()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
        let generalSpacing:CGFloat = UIScreen.main.bounds.height < 570 ? 20 : 50
        NSLayoutConstraint.activate([
          scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
           
            headerLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            headerLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: generalSpacing)
        ])
    }
    
    private func routeToSettings() {
        guard let presenter = presenter else { return }
        let settingsRouter = SettingsRouter.createModule(with: presenter.userData)
        self.navigationController?.pushViewController(settingsRouter,animated: true)
    }
}

extension DashboardView: DashboardViewType {
    func display(title: String) {
        headerLabel.text = title
    }
}
