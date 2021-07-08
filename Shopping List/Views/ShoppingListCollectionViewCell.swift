//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Gi Pyo Kim on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    // MARK: Properties
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
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
