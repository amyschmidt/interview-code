//
//  WantsViewController.swift
//  trunkclub
//
//  Created by Amy Schmidt on 1/20/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class WantsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
 
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    var sectionNames : [String] = ["SHIRTS", "PANTS", "SHOES", "ACCESSORIES", "MORE"]
    var sectionData = Array<Array<Items>>()
    
    var selectedSection : Int!
    var selectedItem : Int!
    
    var arrayOfShirts = [Items]()
    var arrayOfPants = [Items]()
    var arrayOfShoes = [Items]()
    var arrayOfAccessories = [Items]()
    var arrayOfMore = [Items]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        //set navBar style and title
        navBar?.backgroundColor = UIColor(red:44.0/255.0, green:62.0/255.0, blue:80.0/255.0, alpha:1.0)
        navBar?.barStyle = UIBarStyle.Black
        navBar?.tintColor = UIColor.whiteColor()
        navigationItem.title = "Build Your Own"

        self.setUpShirts()
        self.setUpPants()
        self.setUpShoes()
        self.setUpAccessories()
        self.setUpMore()
        
        //set up data array
        sectionData.append(arrayOfShirts)
        sectionData.append(arrayOfPants)
        sectionData.append(arrayOfShoes)
        sectionData.append(arrayOfAccessories)
        sectionData.append(arrayOfMore)
        println(sectionData)
        
        self.itemCollectionView.allowsMultipleSelection = false
        
    }

    
    func setUpShirts() {
        //create array of shirt types and images
        var tshirt = Items(image: "tshirt-icon.png", type: "T-Shirts")
        var polo = Items(image: "tshirt-icon.png", type: "Polos")
        var casual = Items(image: "tshirt-icon.png", type: "Casual Shirts")
        var dress = Items(image: "tshirt-icon.png", type: "Dress Shirts")

        arrayOfShirts.append(tshirt)
        arrayOfShirts.append(polo)
        arrayOfShirts.append(casual)
        arrayOfShirts.append(dress)

    }
    
    
    func setUpPants() {
        var jeans = Items(image: "tshirt-icon.png", type: "Jeans")
        var chinos = Items(image: "tshirt-icon.png", type: "Chinos")
        var dress = Items(image: "tshirt-icon.png", type: "Dress Pants")
        
        
        arrayOfPants.append(jeans)
        arrayOfPants.append(chinos)
        arrayOfPants.append(dress)
        
    }
    
    func setUpShoes() {
        var casual = Items(image: "tshirt-icon.png", type: "Casual Shoes")
        var dress = Items(image: "tshirt-icon.png", type: "Dress Shoes")
        
        arrayOfShoes.append(casual)
        arrayOfShoes.append(dress)
        
    }
    
    func setUpAccessories() {
        var ties = Items(image: "tshirt-icon.png", type: "Ties")
        var belts = Items(image: "tshirt-icon.png", type: "Belts")
        var bags = Items(image: "tshirt-icon.png", type: "Bags")
        
        
        arrayOfAccessories.append(ties)
        arrayOfAccessories.append(belts)
        arrayOfAccessories.append(bags)
        
    }
    
    func setUpMore() {
        var shorts = Items(image: "tshirt-icon.png", type: "Shorts")
        var blazers = Items(image: "tshirt-icon.png", type: "Blazers")
        var sweaters = Items(image: "tshirt-icon.png", type: "Sweaters")
        var outerwear = Items(image: "tshirt-icon.png", type: "Outerwear")
        
        
        arrayOfMore.append(shorts)
        arrayOfMore.append(blazers)
        arrayOfMore.append(sweaters)
        arrayOfMore.append(outerwear)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionNames.count
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    //set headers
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var header : UICollectionReusableView! = nil
        
        if kind == UICollectionElementKindSectionHeader {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier:"Header", forIndexPath:indexPath) as UICollectionReusableView
            
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
        
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        let item = sectionData[indexPath.section][indexPath.row]
        cell.setItemCell(item.type, itemImageName: item.image)
        
        cell.backgroundColor = UIColor.whiteColor()
       
        return cell
    }
    
    //selection info
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var itemCell = self.itemCollectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as CustomCollectionViewCell
        itemCell.selected = true
        
        selectedSection = indexPath.section
        selectedItem = indexPath.row
        println("Collection View: Section Selected: \(selectedSection) Item Selected: \(selectedItem)")
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var customizeVC: CustomizeViewController = segue.destinationViewController as CustomizeViewController
        
        let cell = sender as CustomCollectionViewCell
        let path = self.itemCollectionView.indexPathForCell(cell)
        
        selectedSection = path?.section
        selectedItem = path?.row
        
        println("Prepare for Segue: Section Selected: \(selectedSection) Item Selected: \(selectedItem)")
        
        customizeVC.section = selectedSection
        customizeVC.item = selectedItem
    }

}
