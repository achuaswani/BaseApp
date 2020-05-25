//RAS
//  ProfileStyle.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileStyleType {
     var baseStyle: BaseStyle { get }
}
class ProfileStyle: ProfileStyleType {
     var baseStyle = BaseStyle()
}
