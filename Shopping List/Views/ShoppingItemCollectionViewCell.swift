//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
            itemNameLabel.text = shoppingItem.name
            imageView.image = UIImage(data: shoppingItem.imageData)
        
        if shoppingItem.isOnList == true {
            addedLabel.text = "Added"
            
        } else {
            addedLabel.text = "Not Added"
        }
    }
    
    //MARK: - Properties
    
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addedLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
}
