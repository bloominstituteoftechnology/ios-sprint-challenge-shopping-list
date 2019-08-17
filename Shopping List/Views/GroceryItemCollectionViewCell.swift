//
//  GroceryItemCollectionViewCell.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var groceryAddedLabel: UILabel!
    @IBOutlet weak var groceryImageView: UIImageView!
    @IBOutlet weak var groceryNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        groceryNameLabel.text = shoppingItem.name
        if shoppingItem.hasBeenAdded {
            groceryAddedLabel.text = "Added"
        } else {
            groceryAddedLabel.text = "Not Added"
        }
        groceryImageView.image = UIImage(named: shoppingItem.image)
    }
}
