//RAS
//  AboutInteractor.swift
//  BaseApp
//
//  Created by Aswani G on 5/18/20.
//  Copyright © 2020 RAS. All rights reserved.
//

import Foundation
import UIKit

protocol AboutInteractorToPresenterType {
}
class AboutInteractor: AboutInteractorToPresenterType {
    var presenter: AboutPresenter?
    var service:  AboutService?
}
