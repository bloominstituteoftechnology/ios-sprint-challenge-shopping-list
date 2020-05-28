//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var addedToCartLabel: UILabel!
    
    
    private func updateViews() {
                guard let item = shoppingItem else { return }
                     shoppingItemImageView.image = UIImage(named: item.name)
                     shoppingItemLabel.text = item.name

                if item.addedToCart == false {
                    addedToCartLabel.text = "Added"
                } else {
                    addedToCartLabel.text = "Add"
                }
             }
    }
    


