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

}
class SettingsView: UIViewController {
    // MARK: Properties
    var presenter: SettingsPresenterToViewType?
    var style: SettingsStyleType!
    let tableView = UITableView()
    var settingsItems = ["Profile", "About", "Logout"]

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
        return settingsItems.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = settingsItems[indexPath.row]
        return cell
    }
}
