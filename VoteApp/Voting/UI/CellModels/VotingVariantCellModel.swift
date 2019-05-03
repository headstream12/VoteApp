//
//  VotingVariantCellModel.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

struct VotingVariantCellModel: PTableViewCellModel {
    var variantText: String
    var isSelected: Bool
    
    func configure(cell: VotingVariantCell) {
        cell.variantLabel.text = variantText
        cell.checkboxButton.isSelected = isSelected
    }
}
