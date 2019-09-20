//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dennis on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var notAddedButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBAction func notAddedButtonTapped(_ sender: UIButton) {
        notAddedButton.titleLabel?.text = "Added"
        
        
    }
}
