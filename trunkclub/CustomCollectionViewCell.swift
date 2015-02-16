//
//  CustomCollectionViewCell.swift
//  trunkclub
//
//  Created by Amy Schmidt on 1/22/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var customizeLabel: UILabel!
    @IBOutlet weak var customizeImage: UIImageView!
    
    @IBOutlet weak var finalizeImage: UIImageView!
    @IBOutlet weak var finalizeLabel: UILabel!
    
    
    func setItemCell(itemLabelText: String, itemImageName: String) {
        self.itemLabel.text = itemLabelText
        self.itemImage.image = UIImage(named: itemImageName)
    }
    
    func setCustomizeCell(customizeLabelText: String, customizeImageName: String) {
        self.customizeLabel.text = customizeLabelText
        self.customizeImage.image = UIImage(named: customizeImageName)
    }
    
    func setFinalizeCell(finalizeLabelText: String, finalizeImageName: String) {
        self.finalizeLabel.text = finalizeLabelText
        self.finalizeImage.image = UIImage(named: finalizeImageName)
    }
    
}
