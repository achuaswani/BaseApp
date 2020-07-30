//
//  BaseStyle.swift
//  BaseApp
//
//  Created by Aswani G on 5/12/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import UIKit

public protocol  BaseStyleType {
    var backgroundColor: UIColor { get }
    func style(input: UITextField)
    func style(title: UILabel)
    func style(error: UILabel)
    func style(button: UIButton)
    func style(buttonLink: UIButton)
}

open class BaseStyle: BaseStyleType {
    public let font = FontStyle()
    open var backgroundColor: UIColor {
        return .white
    }
    
    public func style(input: UITextField) {
        input.backgroundColor = .clear
        input.textColor = .black
        input.borderStyle = .roundedRect
        input.autocapitalizationType = .none
        input.autocorrectionType = .no
        input.textAlignment = .left
        input.font = font.placeholder
    }
    
    public func style(title: UILabel) {
        title.textAlignment = .center
        title.numberOfLines = 1
        title.textColor = .black
        title.font = font.title
    }
    
    public func style(header1: UILabel) {
        header1.textAlignment = .left
        header1.numberOfLines = 1
        header1.textColor = .black
        header1.font = font.header1
    }
    
    public func style(error: UILabel) {
        error.textAlignment = .left
        error.numberOfLines = 1
        error.textColor = .red
        error.font = font.errorTitle
    }
    
    public func style(button: UIButton) {
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.titleLabel?.font = font.buttonTitle
    }
    
    public func style(buttonLink: UIButton) {
        buttonLink.backgroundColor = .clear
        buttonLink.setTitleColor(UIColor.blue, for: .normal)
        buttonLink.titleLabel?.font = font.buttonTitle
    }
}
