//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 1/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet{ updateViews() }
    }
    
    func updateViews() {
        guard let item = shoppingItem else { return }
        statusLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        itemNameLabel.text = item.itemName
        imageView.image = UIImage(named: item.itemName)
    }
}


