//
//  Appearance.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/2/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

final class Appearance {
    static func apply() {
        let keyboardManager = IQKeyboardManager.shared
        keyboardManager.enable = true
        keyboardManager.shouldResignOnTouchOutside = true
        keyboardManager.previousNextDisplayMode = .alwaysHide
        keyboardManager.enableAutoToolbar = true
        keyboardManager.toolbarDoneBarButtonItemText = "Готово"
        keyboardManager.toolbarBarTintColor = UIColor.white
        keyboardManager.toolbarTintColor = UIColor.Appereance.toolbarTextColor
    }
}
