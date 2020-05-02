//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Clayton Watkins on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    //MARK: - Properties
    var shoppingItem: ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    //MARK: - Helper Function
    func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        nameLabel.text = shoppingItem.itemName
        hasBeenAddedLabel.text = shoppingItem.hasBeenAdded ? "Added" : "Not Added"
        itemImageView.image = shoppingItem.image
    }
}
