//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Richard Gibbs on 5/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    var shoppingItemController = ShoppingItemController()
    
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    
    
    func updateViews() {
        guard let item = item else { return }
        shoppingItemLabel.text = item.name
        imageView.image = UIImage(named: item.imageName)!
        switch item.added {
        case true:
            hasBeenAddedLabel.text = "Added"
        case false:
            hasBeenAddedLabel.text = "Not Added"
        }
        shoppingItemController.saveToPersistentStore()
        shoppingItemController.updateShoppingList(for: item)
    
    }
    
    
}
