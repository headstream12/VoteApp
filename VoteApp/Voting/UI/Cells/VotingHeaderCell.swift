//
//  VotingHeaderCell.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

class VotingHeaderCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hideSeparator()
        selectionStyle = .none
    }
}
