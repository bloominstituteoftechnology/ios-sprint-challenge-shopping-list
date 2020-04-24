//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Enzo Jimenez-Soto on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    // MARK: Properties

    @IBOutlet weak var isAddedLabel: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        switch shoppingItem.isAdded {
        case true:
            isAddedLabel.text = "Added"
        case false:
            isAddedLabel.text = "Not Added"
        }
        
        itemImageView.image = UIImage(named: shoppingItem.name)
        itemNameLabel.text = shoppingItem.name
    }
}
