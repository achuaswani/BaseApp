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
    func style(input: UITextField)
    func style(label: UILabel)
    func style(button: UIButton)
}
class LoginStyle: LoginStyleType {
    var backgroundColor: UIColor {
        return .white
    }
    
    func style(input: UITextField) {
        input.backgroundColor = .clear
        input.textColor = .black
        input.borderStyle = .roundedRect
        input.autocapitalizationType = .none
        input.autocorrectionType = .no
        input.textAlignment = .left
    }
    
    func style(label: UILabel) {
        label.textAlignment = .center
        label.numberOfLines = 1
    }
    
    func style(button: UIButton) {
        button.backgroundColor = .black
    }
}
