//RAS
//  RegisterStyle.swift
//  BaseApp
//
//  Created by Aswani G on 3/13/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterStyleType {
   var baseStyle: BaseStyle { get }
}
class RegisterStyle: RegisterStyleType {
    var baseStyle = BaseStyle()
}
