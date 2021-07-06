//
//  ShoppingCell.swift
//  Shopping List
//
//  Created by Mitchell Budge on 5/5/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCell: UICollectionViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var shoppingImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        shoppingImageView.image = UIImage(named: shoppingItem.itemName)
        shoppingItemLabel.text = shoppingItem.itemName
        if shoppingItem.hasBeenAdded == false {
            statusLabel.text = "Not added"
        } else if shoppingItem.hasBeenAdded == true {
            statusLabel.text = "Added"
        }
    }
    
}


