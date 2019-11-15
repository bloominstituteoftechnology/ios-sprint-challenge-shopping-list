//
//  FoodCollectionViewCell.swift
//  Shopping List
//
//  Created by Sezen Bozdogan on 15.11.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    
    @IBAction func addFoodButton(_ sender: Any) {
    }
    
    @IBOutlet weak var FoodImageView: UIImageView!
    
    @IBOutlet weak var FoodLabel: UILabel!
    var shoppingItem: ShoppingItem? {
    didSet {
        updateViews()
    }
}

func updateViews() {
    
    guard let shoppingItem = shoppingItem else { return}
   // shoppingItemLabel.text = shoppingItem.itemNames
    
 //   shoppingItemImagesView.image = shoppingItem.hasBeenAdded
    }



}
