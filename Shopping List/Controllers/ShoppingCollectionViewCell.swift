//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 20/12/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hasBeenSeenButton: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func hasBeenAddedTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    func updateViews() {
        if let shoppingItem = shoppingItem {
            itemImage.image = shoppingItem.image
            itemName.text = shoppingItem.name
            
            if shoppingItem.hasBeenAdded {
                hasBeenSeenButton.setTitle("Added", for: .normal)
            } else {
                hasBeenSeenButton.setTitle("Not Added", for: .normal)
            }
        }
    }
}
