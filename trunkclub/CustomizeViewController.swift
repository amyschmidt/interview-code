//
//  CustomizeViewController.swift
//  trunkclub
//
//  Created by Amy Schmidt on 1/22/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    @IBOutlet weak var customizeCollectionView: UICollectionView!
    var wantsViewController: UIViewController?
    
    var sectionNames : [String] = ["STYLES", "COLORS"]
    var sectionData = Array<Array<Items>>()

    var section : Int!
    var item : Int!
    var clothingItem : Items!
    var itemChosen : ItemGroup!
    var itemsChosenArray : [ItemGroup] = []
    
    var arrayOfStyles = [Items]()
    var arrayOfColors = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
        println("View Did Load: Section Selected: \(section) Item Selected: \(item) Clothing Item: \(clothingItem)")
        
        self.setUpStyles()
        self.setUpColors()
        
        sectionData.append(arrayOfStyles)
        sectionData.append(arrayOfColors)
        
        self.customizeCollectionView.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        //set navBar style and title
        navBar?.backgroundColor = UIColor(red:44.0/255.0, green:62.0/255.0, blue:80.0/255.0, alpha:1.0)
        navBar?.barStyle = UIBarStyle.Black
        navBar?.tintColor = UIColor.whiteColor()
        navigationItem.title = "Customize"
    }
    
    
    //create arrays for clothing styles
    func setUpStyles() {
        switch section {
            case 0:
                switch item {
                case 0:
                    var tank = Items(image: "tshirt-icon.png", type: "Tank")
                    var vneck = Items(image: "tshirt-icon.png", type: "V-Neck")
                    var crew = Items(image: "tshirt-icon.png", type: "Crew Neck")
                    
                    arrayOfStyles.append(tank)
                    arrayOfStyles.append(vneck)
                    arrayOfStyles.append(crew)
                case 2:
                    var basic = Items(image: "casual-shirt-icon.png", type: "Basic")
                    var printed = Items(image: "casual-shirt-icon.png", type: "Printed")
                    
                    arrayOfStyles.append(basic)
                    arrayOfStyles.append(printed)
                case 3:
                    var basic = Items(image: "dress-shirt-icon.png", type: "Basic")
                    var printed = Items(image: "dress-shirt-icon.png", type: "Printed")
                    
                    arrayOfStyles.append(basic)
                    arrayOfStyles.append(printed)
                default:
                    var basic = Items(image: "tshirt-icon.png", type: "Basic")
                    var printed = Items(image: "tshirt-icon.png", type: "Printed")
                    
                    arrayOfStyles.append(basic)
                    arrayOfStyles.append(printed)

            }
        case 1:
            switch item {
            case 2:
                var pleated = Items(image: "dress-pants-icon.png", type: "Pleated")
                var flat = Items(image: "dress-pants-icon.png", type: "Flat-Front")
                
                arrayOfStyles.append(pleated)
                arrayOfStyles.append(flat)
            default:
                var bootcut = Items(image: "pants-icon.png", type: "Bootcut")
                var relaxed = Items(image: "pants-icon.png", type: "Relaxed")
                var skinny = Items(image: "pants-icon.png", type: "Skinny")
                var slim = Items(image: "pants-icon.png", type: "Slim Fit")
                var straight = Items(image: "pants-icon.png", type: "Straight Cut")
                
                arrayOfStyles.append(bootcut)
                arrayOfStyles.append(relaxed)
                arrayOfStyles.append(skinny)
                arrayOfStyles.append(slim)
                arrayOfStyles.append(straight)

            }
        case 2:
            switch item {
            case 1:
                var boots = Items(image: "shoes-icon.png", type: "Boots")
                var formal = Items(image: "shoes-icon.png", type: "Formal")
                
                arrayOfStyles.append(boots)
                arrayOfStyles.append(formal)
            default:
                var sneakers = Items(image: "casual-shoes-icon.png", type: "Sneakers")
                var boat = Items(image: "casual-shoes-icon.png", type: "Boat Shoes")
                var sandals = Items(image: "casual-shoes-icon.png", type: "Sandals")
                
                arrayOfStyles.append(sneakers)
                arrayOfStyles.append(boat)
                arrayOfStyles.append(sandals)
            }
        case 3:
            switch item {
            case 0:
                var basic = Items(image: "accessories-icon.png", type: "Basic")
                var narrow = Items(image: "accessories-icon.png", type: "Narrow")
                var printed = Items(image: "accessories-icon.png", type: "Printed")
                
                arrayOfStyles.append(basic)
                arrayOfStyles.append(narrow)
                arrayOfStyles.append(printed)
            case 2:
                var brief = Items(image: "accessories-icon.png", type: "Briefcase")
                var cross = Items(image: "accessories-icon.png", type: "Cross-Body")
                var duffle = Items(image: "accessories-icon.png", type: "Duffle")
                var tote = Items(image: "accessories-icon.png", type: "Tote")
                
                arrayOfStyles.append(brief)
                arrayOfStyles.append(cross)
                arrayOfStyles.append(duffle)
                arrayOfStyles.append(tote)
            default:
                var basic = Items(image: "accessories-icon.png", type: "Basic")
                var printed = Items(image: "accessories-icon.png", type: "Printed")
                
                arrayOfStyles.append(basic)
                arrayOfStyles.append(printed)
            }
        case 4:
            switch item {
            case 0:
                var basic = Items(image: "shorts-icon.png", type: "Basic")
                var chino = Items(image: "shorts-icon.png", type: "Chino")
                var plaid = Items(image: "shorts-icon.png", type: "Plaid")
                
                arrayOfStyles.append(basic)
                arrayOfStyles.append(chino)
                arrayOfStyles.append(plaid)
            case 1:
                var single = Items(image: "blazer-icon.png", type: "Single-Breasted")
                var double = Items(image: "blazer-icon.png", type: "Double-Breasted")
                
                arrayOfStyles.append(single)
                arrayOfStyles.append(double)
            case 2:
                var cardigan = Items(image: "sweaters-icon.png", type: "Cardigan")
                var crew = Items(image: "sweaters-icon.png", type: "Crew Neck")
                var vneck = Items(image: "sweaters-icon.png", type: "V-Neck")
                var pattern = Items(image: "sweaters-icon.png", type: "Patterned")
                var collar = Items(image: "sweaters-icon.png", type: "Collared")
                var cable = Items(image: "sweaters-icon.png", type: "Cable Knit")
                var halfzip = Items(image: "sweaters-icon.png", type: "Half Zip/Pullover")
                var vest = Items(image: "sweaters-icon.png", type: "Sweater Vest")

                arrayOfStyles.append(cardigan)
                arrayOfStyles.append(crew)
                arrayOfStyles.append(vneck)
                arrayOfStyles.append(pattern)
                arrayOfStyles.append(collar)
                arrayOfStyles.append(cable)
                arrayOfStyles.append(halfzip)
                arrayOfStyles.append(vest)
            case 3:
                var trench = Items(image: "outerwear-icon.png", type: "Trench")
                var peacoat = Items(image: "outerwear-icon.png", type: "Pea Coat")
                var leather = Items(image: "outerwear-icon.png", type: "Leather")
                var bomber = Items(image: "outerwear-icon.png", type: "Bomber")
                var vest = Items(image: "outerwear-icon.png", type: "Vest")
                
                arrayOfStyles.append(trench)
                arrayOfStyles.append(peacoat)
                arrayOfStyles.append(leather)
                arrayOfStyles.append(bomber)
                arrayOfStyles.append(vest)
            default:
                var basic = Items(image: "outerwear-icon.png", type: "Basic")
                var printed = Items(image: "outerwear-icon.png", type: "Printed")
                
                arrayOfStyles.append(basic)
                arrayOfStyles.append(printed)

            }
            
        default:
            var basic = Items(image: "tshirt-icon.png", type: "Basic")
            var printed = Items(image: "tshirt-icon.png", type: "Printed")
            
            arrayOfStyles.append(basic)
            arrayOfStyles.append(printed)
        }
        
    }
    
    func setUpColors() {
        //create array of shirt types and images
        switch section {
        case 0:
            switch item {
            case 2:
                var black = Items(image: "casual-shirt-icon.png", type: "Black")
                var white = Items(image: "casual-shirt-icon.png", type: "White")
                var gray = Items(image: "casual-shirt-icon.png", type: "Gray")
                var brown = Items(image: "casual-shirt-icon.png", type: "Brown")
                var navy = Items(image: "casual-shirt-icon.png", type: "Navy")
                var red = Items(image: "casual-shirt-icon.png", type: "Red")
                var blue = Items(image: "casual-shirt-icon.png", type: "Blue")
                var green = Items(image: "casual-shirt-icon.png", type: "Green")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
                arrayOfColors.append(red)
                arrayOfColors.append(blue)
                arrayOfColors.append(green)
            case 3:
                var black = Items(image: "dress-shirt-icon.png", type: "Black")
                var white = Items(image: "dress-shirt-icon.png", type: "White")
                var gray = Items(image: "dress-shirt-icon.png", type: "Gray")
                var brown = Items(image: "dress-shirt-icon.png", type: "Brown")
                var navy = Items(image: "dress-shirt-icon.png", type: "Navy")
                var red = Items(image: "dress-shirt-icon.png", type: "Red")
                var blue = Items(image: "dress-shirt-icon.png", type: "Blue")
                var green = Items(image: "dress-shirt-icon.png", type: "Green")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
                arrayOfColors.append(red)
                arrayOfColors.append(blue)
                arrayOfColors.append(green)

            default:
                var black = Items(image: "tshirt-icon.png", type: "Black")
                var white = Items(image: "tshirt-icon.png", type: "White")
                var gray = Items(image: "tshirt-icon.png", type: "Gray")
                var brown = Items(image: "tshirt-icon.png", type: "Brown")
                var navy = Items(image: "tshirt-icon.png", type: "Navy")
                var red = Items(image: "tshirt-icon.png", type: "Red")
                var blue = Items(image: "tshirt-icon.png", type: "Blue")
                var green = Items(image: "tshirt-icon.png", type: "Green")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
                arrayOfColors.append(red)
                arrayOfColors.append(blue)
                arrayOfColors.append(green)
            }
        case 1:
            switch item {
            case 0:
                var original = Items(image: "pants-icon.png", type: "Original Blue")
                var dark = Items(image: "pants-icon.png", type: "Dark Wash")
                var light = Items(image: "pants-icon.png", type: "Light Wash")
                
                arrayOfColors.append(original)
                arrayOfColors.append(dark)
                arrayOfColors.append(light)
            case 1:
                var black = Items(image: "pants-icon.png", type: "Black")
                var white = Items(image: "pants-icon.png", type: "White")
                var gray = Items(image: "pants-icon.png", type: "Gray")
                var brown = Items(image: "pants-icon.png", type: "Brown")
                var pastel = Items(image: "pants-icon.png", type: "Pastel Colors")
                var bright = Items(image: "pants-icon.png", type: "Bright Colors")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(pastel)
                arrayOfColors.append(bright)
            default:
                var black = Items(image: "dress-pants-icon.png", type: "Black")
                var navy = Items(image: "dress-pants-icon.png", type: "Navy")
                var gray = Items(image: "dress-pants-icon.png", type: "Gray")
                
                arrayOfColors.append(black)
                arrayOfColors.append(navy)
                arrayOfColors.append(gray)
            }
        case 2:
            switch item {
            case 0:
                var black = Items(image: "casual-shoes-icon.png", type: "Black")
                var white = Items(image: "casual-shoes-icon.png", type: "White")
                var gray = Items(image: "casual-shoes-icon.png", type: "Gray")
                var brown = Items(image: "casual-shoes-icon.png", type: "Brown")
                var navy = Items(image: "casual-shoes-icon.png", type: "Navy")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
            default:
                var black = Items(image: "shoes-icon.png", type: "Black")
                var white = Items(image: "shoes-icon.png", type: "White")
                var gray = Items(image: "shoes-icon.png", type: "Gray")
                var brown = Items(image: "shoes-icon.png", type: "Brown")
                var navy = Items(image: "shoes-icon.png", type: "Navy")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
            }
        case 4:
            switch item {
            case 0:
                var black = Items(image: "shorts-icon.png", type: "Black")
                var white = Items(image: "shorts-icon.png", type: "White")
                var gray = Items(image: "shorts-icon.png", type: "Gray")
                var brown = Items(image: "shorts-icon.png", type: "Brown")
                var pastel = Items(image: "shorts-icon.png", type: "Pastel Colors")
                var bright = Items(image: "shorts-icon.png", type: "Bright Colors")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(pastel)
                arrayOfColors.append(bright)
            case 2:
                var black = Items(image: "sweaters-icon.png", type: "Black")
                var white = Items(image: "sweaters-icon.png", type: "White")
                var gray = Items(image: "sweaters-icon.png", type: "Gray")
                var brown = Items(image: "sweaters-icon.png", type: "Brown")
                var pastel = Items(image: "sweaters-icon.png", type: "Pastel Colors")
                var bright = Items(image: "sweaters-icon.png", type: "Bright Colors")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(pastel)
                arrayOfColors.append(bright)
            case 3:
                var black = Items(image: "outerwear-icon.png", type: "Black")
                var white = Items(image: "outerwear-icon.png", type: "White")
                var gray = Items(image: "outerwear-icon.png", type: "Gray")
                var brown = Items(image: "outerwear-icon.png", type: "Brown")
                var navy = Items(image: "outerwear-icon.png", type: "Navy")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
            default:
                var black = Items(image: "blazer-icon.png", type: "Black")
                var white = Items(image: "blazer-icon.png", type: "White")
                var gray = Items(image: "blazer-icon.png", type: "Gray")
                var brown = Items(image: "blazer-icon.png", type: "Brown")
                var navy = Items(image: "blazer-icon.png", type: "Navy")
                
                arrayOfColors.append(black)
                arrayOfColors.append(white)
                arrayOfColors.append(gray)
                arrayOfColors.append(brown)
                arrayOfColors.append(navy)
            }
        default:
            var black = Items(image: "accessories-icon.png", type: "Black")
            var white = Items(image: "accessories-icon.png", type: "White")
            var gray = Items(image: "accessories-icon.png", type: "Gray")
            var brown = Items(image: "accessories-icon.png", type: "Brown")
            var navy = Items(image: "accessories-icon.png", type: "Navy")
            
            arrayOfColors.append(black)
            arrayOfColors.append(white)
            arrayOfColors.append(gray)
            arrayOfColors.append(brown)
            arrayOfColors.append(navy)
        }
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionNames.count
    }
    
    //return number of items
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    //set headers
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var header : UICollectionReusableView! = nil
        
        if kind == UICollectionElementKindSectionHeader {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier:"CustomizeHeader", forIndexPath:indexPath) as UICollectionReusableView
            
            if header.subviews.count == 0 {
                let headerLabel = UILabel()
                header.addSubview(headerLabel)
                
                //set design for label
                headerLabel.textAlignment = .Left
                headerLabel.textColor = UIColor.darkGrayColor()
                headerLabel.font = UIFont(name:"Helvetica Neue-Bold", size:20)
                headerLabel.layer.masksToBounds = true // has to be added for iOS 8 label
                headerLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
                header.addConstraints(
                    NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[lab(125)]",
                        options:nil, metrics:nil, views:["lab":headerLabel]))
                header.addConstraints(
                    NSLayoutConstraint.constraintsWithVisualFormat("V:[lab(30)]-5-|",
                        options:nil, metrics:nil, views:["lab":headerLabel]))
                
            }
            
            let headerLabel = header.subviews[0] as UILabel
            headerLabel.text = sectionNames[indexPath.section]
        }
        
        return header
    }
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomizeCell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        let customize = sectionData[indexPath.section][indexPath.row]
        cell.setCustomizeCell(customize.type, customizeImageName: customize.image)
        
        cell.backgroundColor = UIColor.whiteColor()
        
        
        return cell
    }
    
    
     func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var selectedCell = customizeCollectionView.cellForItemAtIndexPath(indexPath) as CustomCollectionViewCell
        
        if (selectedCell.selected) {
            selectedCell.backgroundColor = UIColor.grayColor()
        }
        else {
            selectedCell.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        var deselectedCell = customizeCollectionView.cellForItemAtIndexPath(indexPath) as CustomCollectionViewCell
        
        deselectedCell.backgroundColor = UIColor.whiteColor()
       
    }
    
    
    @IBAction func addCustomizations(sender: AnyObject) {
        var paths = self.customizeCollectionView.indexPathsForSelectedItems()
        
        if paths.count == 0 {
            println("No Items Chosen")
        }
        else {
            var stylesChosen : [Items]! = []
            var colorsChosen : [Items]! = []
            
            for path in paths {
            
                var selectedSection = path.section
                var selectedRow = path.row
                
                var selectedItem = sectionData[selectedSection][selectedRow]
                
                if (selectedSection == 0) {
                    //styles
                    var style: Items = selectedItem
                    println(style.type)
                    
                    //append to styles array of items
                    stylesChosen.append(style)
                }
                else {
                    
                    //colors
                    var color: Items = selectedItem
                    
                    println(color.type)
                    
                    //append to colors array of items
                    colorsChosen.append(color)
                    
                }
                
            }
            
            itemChosen = ItemGroup(clothingType: clothingItem, styles: stylesChosen, colors: colorsChosen)
            
            //append to items chosen array
            itemsChosenArray.append(itemChosen)
            
            
        }
    
    }
    
    
}
