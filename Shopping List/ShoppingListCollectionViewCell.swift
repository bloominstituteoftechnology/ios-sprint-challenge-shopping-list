//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let picture = shoppingItem?.image else { return }
        imageView.image = UIImage(data: picture)
        itemNameLabel.text = shoppingItem?.itemName
        if shoppingItem?.addedToList == true {
            addedLabel.text = "Added"
        } else {
            addedLabel.text = "Not Added"
        }
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingListController = ShoppingListController()
}
