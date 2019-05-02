//
//  AuthViewController.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/2/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        let fullTitle = "Добро пожаловать"
        let attributedString = NSMutableAttributedString(string: fullTitle)
        let yaColor = #colorLiteral(red: 0.9215686275, green: 0.1960784314, blue: 0.1254901961, alpha: 1)
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: yaColor, range: NSRange(location: 0, length: 1))
        titleLabel.attributedText = attributedString
        
    }
}
