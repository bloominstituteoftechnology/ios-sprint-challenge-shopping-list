//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Linh Bouniol on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet var addedNotAddedLabel: UILabel!
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    // MARK: - Methods
    
    // When the cell is tapped, the label should change from "not added" to "added"
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        
        
        if shoppingItem.hasBeenAdded ==  true {
            addedNotAddedLabel.text = "Added"
        } else {
            addedNotAddedLabel.text = "Not Added"
        }
    }
}
