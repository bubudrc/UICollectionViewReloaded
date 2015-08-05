//
//  MyCollectionViewCell.swift
//  UICollectionViewReloaded
//
//  Created by marcelo.perretta@gmail.com on 8/4/15.
//  Copyright (c) 2015 MAWAPE. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    //1.
    @IBOutlet weak var textLabel:UILabel!
    
    //2.
    var text:String = "" {
        didSet {
            self.textLabel.text = text
        }
           
    }
    
    //3.
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        
        self.textLabel.frame = self.bounds
        self.textLabel.textAlignment = .Center
        self.textLabel.font = UIFont.boldSystemFontOfSize(20)
        self.addSubview(self.textLabel)
    }

    //4.
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //5.
    //MARK: - Overriden UICollectionViewCell methods
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.text = ""
    }
    
}
