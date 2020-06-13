//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Gladymir Philippe on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: ShoppingListCollectionViewController?
    var shoppingItemController: ShoppingItemController?
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addedLabel: UILabel!
    
    func updateViews() {
        guard let item = shoppingItem else {
            print("error; cell has no item!")
            return
        }
        
        itemImage.image = UIImage(named: item.name)
        nameLabel.text = item.name
        addedLabel.text = item.added ? "Added" : "Not added"
        shoppingItemController?.update(item: item, to: item.added
        )
        
    }
    
    func addItemToCart() {
        shoppingItem?.added.toggle()
        updateViews()
    }
}
