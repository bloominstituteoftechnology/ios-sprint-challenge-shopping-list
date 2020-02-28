//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
   // TODO: Why can't I create an action from the cell?

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func updateViews() {
        guard let name = shoppingItem?.itemName,
            let pic = shoppingItem?.imageName else { return }

        imageView.image = UIImage(contentsOfFile: pic)
        itemNameLabel.text = name
    }
}

