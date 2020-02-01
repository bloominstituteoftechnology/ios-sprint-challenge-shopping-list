//
//  ListOfItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ListOfItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    @IBAction func itemAddedTappedButton(_ sender: Any) {
    }
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingItemImage.image = shoppingItem.image
        shoppingItemNameLabel.text = shoppingItem.nameOfItem
        
    }
}
