//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingImageView: UIImageView!
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var AddedLabel: UILabel!
    
    var shopping: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let shopping = shopping else { return }
        shoppingImageView.image = shopping.itemImage
        ItemNameLabel.text = shopping.itemNames
        AddedLabel.text = shopping.itemAdded ? "Remove" : "Add"
        
    }
}
