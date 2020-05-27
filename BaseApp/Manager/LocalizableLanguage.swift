//
//  LocalizableLanguage.swift
//  BaseApp
//
//  Created by Aswani G on 5/7/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

enum LocalizableLanguage: String, Codable {
    case en = "en"
    case ml = "ml"
    var index: Int {
        switch self {
        case .en:
            return 0
        case .ml:
            return 1
        }
    }
}

extension LocalizableLanguage {
    enum CodingKeys: String, CodingKey {
        case rawValue
    }
    
    enum CodingError: Error {
        case undknownValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawValue = try container.decode(String.self, forKey: .rawValue)
        switch rawValue {
        case "EN":
            self = .en
        case "ML":
            self = .ml
        default:
            throw CodingError.undknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .en:
            try container.encode("EN", forKey: .rawValue)
        case .ml:
            try container.encode("ML", forKey: .rawValue)
        }
    }
}

extension String {
    public func localized() -> String {
        let languageManager = LanguageManager.shared
        let bundle: Bundle = .main
        if let currentLanguage = languageManager.getCurrentLanguage() {
            if let path = bundle.path(forResource: currentLanguage.rawValue, ofType: "lproj"),
                let bundle = Bundle(path: path) {
                 return bundle.localizedString(forKey: self, value: nil, table: nil)
                }
        }
        return self
    }
    
    public func localized(with element: String) -> String {
        return String(format: NSLocalizedString(self, comment: ""), element)
    }
}
