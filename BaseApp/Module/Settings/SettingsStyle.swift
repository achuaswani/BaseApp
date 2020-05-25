//RAS
//  SettingsStyle.swift
//  BaseApp
//
//  Created by Aswani G on 5/15/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsStyleType {
    var backgroundColor: UIColor { get }
}
class SettingsStyle: SettingsStyleType {
    var backgroundColor: UIColor {
        return .white
    }
}
