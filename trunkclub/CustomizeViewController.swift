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
    
    var selected = -1
    
    var sectionNames : [String] = ["STYLES", "COLORS"]
    var sectionData = Array<Array<Items>>()

    var arrayOfStyles = [Items]()
    var arrayOfColors = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        //set navBar style and title
        navBar?.backgroundColor = UIColor(red:44.0/255.0, green:62.0/255.0, blue:80.0/255.0, alpha:1.0)
        navBar?.barStyle = UIBarStyle.Black
        navBar?.tintColor = UIColor.whiteColor()
        navigationItem.title = "Customize"
        
        self.setUpStyles()
        self.setUpColors()
        
        sectionData.append(arrayOfStyles)
        sectionData.append(arrayOfColors)
        
        self.customizeCollectionView.allowsMultipleSelection = false
        // Do any additional setup after loading the view.
    }
    

    func setUpStyles() {
        //create array of shirt types and images
        var tank = Items(image: "tshirt-icon.png", type: "Tank")
        var vneck = Items(image: "tshirt-icon.png", type: "V-Neck")
        var crew = Items(image: "tshirt-icon.png", type: "Crew Neck")
        
        arrayOfStyles.append(tank)
        arrayOfStyles.append(vneck)
        arrayOfStyles.append(crew)
       
        
    }
    
    func setUpColors() {
        //create array of shirt types and images
        var black = Items(image: "tshirt-icon.png", type: "Black")
        var white = Items(image: "tshirt-icon.png", type: "White")
        var gray = Items(image: "tshirt-icon.png", type: "Gray")
        var red = Items(image: "tshirt-icon.png", type: "Red")
        var blue = Items(image: "tshirt-icon.png", type: "Blue")
        var green = Items(image: "tshirt-icon.png", type: "Green")
        
        arrayOfColors.append(black)
        arrayOfColors.append(white)
        arrayOfColors.append(gray)
        arrayOfColors.append(red)
        arrayOfColors.append(blue)
        arrayOfColors.append(green)
        
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
    
    var customizeCell = self.customizeCollectionView.dequeueReusableCellWithReuseIdentifier("CustomizeCell", forIndexPath: indexPath) as CustomCollectionViewCell
    customizeCell.selected = true
    
    if(selected != -1){
        
        var previous = self.customizeCollectionView.dequeueReusableCellWithReuseIdentifier("CustomizeCell", forIndexPath: NSIndexPath(forRow: selected, inSection: 0)) as CustomCollectionViewCell
        previous.selected = false
        
    }
        
    let customize = sectionData[indexPath.section][indexPath.row]
    customizeCollectionView.reloadData()

    
    
    }



}
