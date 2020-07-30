//RAS
//  LoginStyle.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 1/28/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

public protocol LoginStyleType {
    var baseStyle: BaseStyle { get }
}
public class LoginStyle: LoginStyleType {
    public var baseStyle = BaseStyle()
    public init() {}
}
