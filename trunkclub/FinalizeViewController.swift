//
//  FinalizeViewController.swift
//  trunkclub
//
//  Created by Amy Schmidt on 2/15/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class FinalizeViewController: UIViewController {

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var itemsChosenArray : [ItemGroup] = []
    var sectionData = Array<Array<ItemGroup>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionData.append(itemsChosenArray)
        
    }

    override func viewWillAppear(animated: Bool) {
        
        println(itemsChosenArray.count)
        
        for item in itemsChosenArray {
            println("View will appear in Finalize Type: \(item.clothingType.type)")
            for style in item.styles {
                println("Styles: \(style.type)")
            }
            for color in item.colors {
                println("Colors: \(color.type)")
            }
        }
        
        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        //set navBar style and title
        navBar?.backgroundColor = UIColor(red:44.0/255.0, green:62.0/255.0, blue:80.0/255.0, alpha:1.0)
        navBar?.barStyle = UIBarStyle.Black
        navBar?.tintColor = UIColor.whiteColor()
        navigationItem.title = "Finalize"
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return itemsChosenArray.count
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData[section].count
        
    }
    
    
    
    //set cells
    /*func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("FinalCell", forIndexPath: indexPath) as CustomCollectionViewCell
        
        
        cell.setFinalizeCell()
        
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }*/



}
