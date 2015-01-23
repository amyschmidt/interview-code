//
//  ShirtCustomCell.swift
//  trunkclub
//
//  Created by Amy Schmidt on 1/20/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shirtImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(titleLabelText: String, shirtImageName: String) {
        self.titleLabel.text = titleLabelText
        self.shirtImage.image = UIImage(named: shirtImageName)
    }

}
