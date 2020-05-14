//RAS
//  DashboardStyle.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 2/19/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardStyleType {
    var backgroundColor: UIColor { get }
    func style(button: UIButton)
}
class DashboardStyle: DashboardStyleType {
    var backgroundColor: UIColor {
        return .white
    }
    
    func style(button: UIButton) {
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
    }
}
