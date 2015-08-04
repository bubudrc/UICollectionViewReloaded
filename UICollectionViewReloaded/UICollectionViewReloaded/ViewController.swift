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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

