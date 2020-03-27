//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var addedLabel: UILabel!
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemNameLabel: UILabel!
    
    // MARK: - Properties
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        addedLabel.text = shoppingItem.hasAddedItem ? "Added" : "Not Added"
        itemNameLabel.text = shoppingItem.name
        itemImageView.image = shoppingItem.image
        
    }
    
}
