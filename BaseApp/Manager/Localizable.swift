//
//  LocalizableLanguage.swift
//  BaseApp
//
//  Created by Aswani G on 5/7/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

extension String {
     public func localized(withComment comment: String = "") -> String {
        return NSLocalizedString(self, bundle: Bundle.module, comment: comment)
    }
}

extension Bundle {
    private static let bundleID = "org.cocoapods.BaseApp"

    static var module: Bundle {
        return .main
//        guard let path = Bundle(identifier: bundleID)?.resourcePath else { return .main }
//        return Bundle(path: path.appending("/BaseApp.bundle")) ?? .main
    }
}
