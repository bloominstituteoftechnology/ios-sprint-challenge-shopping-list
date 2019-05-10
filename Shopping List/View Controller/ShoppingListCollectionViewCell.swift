//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Hayden Hastings on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        itemImageView.image = UIImage(named: shoppingItem.itemName)
        itamNameLabel.text = shoppingItem.name
        if shoppingItem.hasBeenAdded == false {
            hasBeenAdded.text = "Not Added"
        } else if shoppingItem.hasBeenAdded == true {
            hasBeenAdded.text = "Added"
        }
    }
    
    @IBOutlet weak var hasBeenAdded: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itamNameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
}
