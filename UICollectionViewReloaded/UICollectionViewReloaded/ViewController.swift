//
//  ViewController.swift
//  UICollectionViewReloaded
//
//  Created by marcelo.perretta@gmail.com on 8/4/15.
//  Copyright (c) 2015 MAWAPE. All rights reserved.
//

import UIKit

let CellIdentifier = "Cell Identifier"

class ViewController: UICollectionViewController {

    var datesArray = [NSDate]()
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //1.
        //instantiate our model
        dateFormatter.dateFormat = "h:mm:ss";
        dateFormatter.locale = NSLocale.currentLocale()
        
        //2.
        //configure our collection view layout
        let flowLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumInteritemSpacing = 40.0;
        flowLayout.minimumLineSpacing = 40.0;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        flowLayout.itemSize = CGSizeMake(200, 200);
        
        //3.
        // Register cell classes
        self.collectionView!.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier)
        self.collectionView!.indicatorStyle = .White
        
        //4.
        //configure our navigation item
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "userTappedAddButton:")
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.title = "Our Time Machine"

    }

    // MARK: - UICollectionViewDataSource
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datesArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:MyCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        cell.text = dateFormatter.stringFromDate(datesArray[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - User Interface Interaction Methods
    func userTappedAddButton(sender:AnyObject){
        
        //1.
        self.collectionView!.performBatchUpdates({
            
            //2.
            let newDate = NSDate()
            //3.
            self.datesArray.insert(newDate, atIndex: 0)
            
            //4.
            let insertIndexPath = NSIndexPath(forItem: 0, inSection: 0)
            
            //5.
            self.collectionView!.insertItemsAtIndexPaths([insertIndexPath])
            }, completion: nil)
    }

}

