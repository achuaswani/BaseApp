//RAS
//  LoginStyle.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol LoginStyleType {
    var backgroundColor: UIColor { get }
}
class LoginStyle: LoginStyleType {
    var backgroundColor: UIColor {
        return .white
    }
}
