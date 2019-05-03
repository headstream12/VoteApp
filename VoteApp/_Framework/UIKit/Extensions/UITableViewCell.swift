//
//  UITableViewCell.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}
