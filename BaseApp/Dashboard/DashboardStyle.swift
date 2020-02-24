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
}
class DashboardStyle: DashboardStyleType {
    var backgroundColor: UIColor {
        return .white
    }
}
