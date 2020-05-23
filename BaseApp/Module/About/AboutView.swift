//RAS
//  AboutView.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol AboutViewType {

}
class AboutView: UIViewController {

    // MARK: Properties

    var presenter: AboutPresenterToViewType?
    var style: AboutStyleType!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.start()
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        let margins = view.layoutMarginsGuide
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension AboutView: AboutViewType {
    // TODO: implement view output methods
}
