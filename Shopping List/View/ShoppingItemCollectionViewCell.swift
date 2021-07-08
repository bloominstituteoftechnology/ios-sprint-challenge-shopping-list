//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Juan M Mariscal on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemAddedBoolLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        itemImageView.image = item.itemImageName
        itemNameLabel.text = item.itemName
    }
    
}
