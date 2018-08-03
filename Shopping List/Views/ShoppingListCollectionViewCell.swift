//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else {return }
        
        let image = UIImage(data: shoppingItem.image)
        itemImageView.image = image
        nameLabel.text = shoppingItem.name
        
    }
}
