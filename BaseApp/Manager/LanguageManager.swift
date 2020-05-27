//
//  LanguageManager.swift
//  BaseApp
//
//  Created by Aswani G on 5/7/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    let userDefaults = UserDefaults.standard
    func setCurrentLanguage(to lang: LocalizableLanguage) {
        let jsonEncoder = JSONEncoder()
        if let encodedData = try? jsonEncoder.encode(lang) {
            userDefaults.set(encodedData, forKey: "lang")
            userDefaults.synchronize()
        } else {
            print("can not save a language")
        }
    }
    
    func getCurrentLanguage() -> LocalizableLanguage? {
        if let currentLanguageData = userDefaults.value(forKey: "lang") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                let currentLanguage = try jsonDecoder.decode(LocalizableLanguage.self, from: currentLanguageData)
                return currentLanguage
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
