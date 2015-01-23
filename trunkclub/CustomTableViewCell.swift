//
//  CustomTableViewCell.swift
//  trunkclub
//
//  Created by Amy Schmidt on 1/21/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
        func setCell(titleLabelText: String, imageName: String) {
            self.titleLabel.text = titleLabelText
            self.itemImage.image = UIImage(named: imageName)
        }
    

}
