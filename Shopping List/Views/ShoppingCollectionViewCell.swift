//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ShoppingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func addToListTapped(_ sender: UIButton) {
        if addedLabel.text == "On List"{
            addedLabel.text = "Off List"
        } else {
            addedLabel.text = "On List"
        }
    }

    
}


