//RAS
//  SettingsView.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsViewType {
    func routeToLogin()
    func displayErrorPopup()
    func displayAboutScreen()
    func displayProfileScreen(with userdata: UserDataEntity)
}
class SettingsView: UIViewController {
    // MARK: Properties
    var presenter: SettingsPresenterToViewType?
    var style: SettingsStyleType!
    let tableView = UITableView()
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 45.0
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupLayout() {
      view.addSubview(tableView)
      let margins = view.layoutMarginsGuide
      NSLayoutConstraint.activate([
          tableView.topAnchor.constraint(equalTo: margins.topAnchor),
          tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    }
}

extension SettingsView: SettingsViewType, UITableViewDelegate, UITableViewDataSource {
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.settingsItems.count ?? 0
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = presenter?.settingsItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedRow(at: indexPath.row)
    }
    
    func routeToLogin() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
   
    func displayErrorPopup() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: nil)
            }
          )
        )
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayAboutScreen() {
        let aboutScreen = AboutRouter.createModule()
        self.navigationController?.pushViewController(aboutScreen,animated: true)
    }
    
    func displayProfileScreen(with userdata: UserDataEntity) {
        let profile = ProfileRouter.createModule(with: userdata)
        self.navigationController?.pushViewController(profile,animated: true)
    }
}
