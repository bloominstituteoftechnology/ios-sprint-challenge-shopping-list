//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    // Property
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        nameLabel.text = shoppingItem.name
        imageView.image = UIImage(named: shoppingItem.name)
        
        
        if shoppingItem.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
    }
}
