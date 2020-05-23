//RAS
//  AboutStyle.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol AboutStyleType {
     var baseStyle: BaseStyle { get }
}
class AboutStyle: AboutStyleType {
     var baseStyle = BaseStyle()
}
