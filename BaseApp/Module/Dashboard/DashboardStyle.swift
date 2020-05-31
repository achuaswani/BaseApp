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
     var baseStyle: BaseStyle { get }
}
open class DashboardStyle: DashboardStyleType {
    var baseStyle = BaseStyle()
}
