//
//  ItemGroup.swift
//  trunkclub
//
//  Created by Amy Schmidt on 2/12/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class ItemGroup: NSObject {
    
    var clothingType: Items
    var styles: [Items]
    var colors: [Items]
    
    init(clothingType: Items, styles: [Items], colors: [Items]) {
        self.clothingType = clothingType
        self.styles = styles
        self.colors = colors
    }
    
    
   
}
