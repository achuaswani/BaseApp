//
//  Style.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 11/19/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import UIKit
protocol BaseStyle {
    func titleView(title: String, subtitle: String?) -> UIView

    func barButton(title: String, isLeftButton: Bool) -> UIBarButtonItem

    func backButton(target: AnyObject, action: Selector) -> UIBarButtonItem

    func closeButton(target: AnyObject, action: Selector) -> UIBarButtonItem

    func button() -> UIButton

    func primaryButton() -> UIButton

    func secondaryButton() -> UIButton
}

class Style {
    enum TextStyle {
        case navigationBar
        case title
        case subtitle
        case body
        case button
    }

    struct TextAttributes {
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?

        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }

    // MARK: - General Properties
    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes)
    {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: - Convenience Getters
    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }
}
