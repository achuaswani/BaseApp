//
//  FontStyle.swift
//  BaseApp
//
//  Created by Aswani G on 5/12/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import UIKit

open class FontStyle {
    init() {}
    public var title: UIFont {
        return UIFont(name: "Gill Sans", size: 24)!
    }
    
    public var header1: UIFont {
        return UIFont(name: "Gill Sans", size: 14)!
    }
    
    public var buttonTitle: UIFont {
        return UIFont(name: "Gill Sans", size: 18)!
    }
    
    public var placeholder: UIFont {
        return UIFont(name: "Gill Sans", size: 14)!
    }
    
    public var errorTitle: UIFont {
        return UIFont(name: "Gill Sans", size: 12)!
    }
}
