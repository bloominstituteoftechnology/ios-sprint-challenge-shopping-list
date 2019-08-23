//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Austin Potts on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    var item: Item? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let item = item else {return}
        
        itemNameLabel.text = item.name
        itemImageView.image = item.image
        
        
        
    }
}
