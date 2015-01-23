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
    
    var selected = -1

    var sectionNames : [String] = ["SHIRTS", "PANTS"]
    var sectionData = Array<Array<Items>>()
    
    var arrayOfShirts = [Items]()
    var arrayOfPants = [Items]()
    
    
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
        
        //set up data array
        sectionData.append(arrayOfShirts)
        sectionData.append(arrayOfPants)
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
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sectionNames.count
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        let item = sectionData[indexPath.section][indexPath.row]
        cell.setItemCell(item.type, itemImageName: item.image)
        
        cell.backgroundColor = UIColor.whiteColor()
       
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        var itemCell = self.itemCollectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as CustomCollectionViewCell
        itemCell.selected = true;
        
        if(selected != -1){
            var previous = self.itemCollectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: NSIndexPath(forRow: selected, inSection: 0)) as CustomCollectionViewCell
            previous.selected = false;
        }
        selected = indexPath.row;
        itemCollectionView.reloadData();
        
        println(itemCell.selected)
        println(selected)
        
    }

}
