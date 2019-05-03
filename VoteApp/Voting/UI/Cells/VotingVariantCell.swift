//
//  VotingVariantCell.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

class VotingVariantCell: UITableViewCell {

    @IBOutlet weak var variantLabel: UILabel!
    @IBOutlet weak var checkboxButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkboxButton.setImage(#imageLiteral(resourceName: "selectedCheckbox"), for: .selected)
        checkboxButton.setImage(#imageLiteral(resourceName: "selectedCheckbox"), for: .highlighted)
        checkboxButton.setImage(#imageLiteral(resourceName: "unselectedCheckbox"), for: .normal)
        selectionStyle = .none
    }
}
