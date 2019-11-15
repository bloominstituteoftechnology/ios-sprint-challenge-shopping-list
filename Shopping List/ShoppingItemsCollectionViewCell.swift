//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_218 on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var item: Item? {
        
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        
        itemLabel.text = item.name
        itemImage.image = item.image
    }
    
}
