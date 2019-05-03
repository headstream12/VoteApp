//
//  VotingHeaderCellModel.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

struct VotingHeaderCellModel: PTableViewCellModel {
    var title: String
    var description: String
    
    func configure(cell: VotingHeaderCell) {
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
    }
}
