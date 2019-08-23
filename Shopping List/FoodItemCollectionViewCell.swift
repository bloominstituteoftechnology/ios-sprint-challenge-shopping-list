//
//  FoodItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Uptiie on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FoodItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? { didSet { updateViews()}}
    
    @IBOutlet weak var addedToCartLabel: UILabel!
    @IBOutlet weak var foodItemNameLabel: UILabel!
    @IBOutlet weak var foodItemImage: UIImageView!
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        addedToCartLabel.text = "\(shoppingItem.isAdded)"
        foodItemImage.image = UIImage(data: shoppingItem.imageData)
        foodItemNameLabel.text = shoppingItem.item
        
    }
}
