//
//  ShopCell.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    
    @IBOutlet weak var itemStatus: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    var shoppingItem : ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        if shoppingItem.isAdded {
            itemStatus.text = "Added"
        } else {
            itemStatus.text = "Not added"
        }
        
        itemImage.image = shoppingItem.image
        itemName.text = shoppingItem.name
    }
    
}
