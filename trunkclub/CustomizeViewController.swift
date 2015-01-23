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
    
    var arrayOfStyles: [Items] = [Items]()
    
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
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //return number of items
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println(arrayOfStyles.count)
        return arrayOfStyles.count
    }
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let customizeCell: CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomizeCell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        let customize = arrayOfStyles[indexPath.row]
        customizeCell.setCustomizeCell(customize.type, customizeImageName: customize.image)
        
        customizeCell.backgroundColor = UIColor.whiteColor()
        
        return customizeCell
    }

}
