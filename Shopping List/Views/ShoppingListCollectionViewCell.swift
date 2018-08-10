//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Lisa Sampson on 8/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        itemImage?.image = UIImage(named: shoppingItem.image)
        itemLabel?.text = shoppingItem.item
        
        if shoppingItem.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
    }
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
}
