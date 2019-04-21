//
//  ViewController.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 4/21/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let enc = Encrypter()
        print(enc.encrypt(12))
    }


}

