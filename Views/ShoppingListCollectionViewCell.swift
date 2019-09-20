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
    
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        
//        imageView.image = planet.image
//        textLabel.text = planet.name
        
    }
    
}
