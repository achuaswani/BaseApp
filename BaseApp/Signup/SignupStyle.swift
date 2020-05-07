//RAS
//  SignupStyle.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol SignupStyleType {
    var backgroundColor: UIColor { get }
}
class SignupStyle: SignupStyleType {
    var backgroundColor: UIColor {
        return .white
    }
}
