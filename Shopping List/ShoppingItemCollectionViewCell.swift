//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Bradley Yin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hasAddedLabel: UILabel!
    
    var shoppingItem : ShoppingItem?{
        didSet{
            updateViews()
        }
    }
    private func updateViews(){
        guard let shoppingItem = shoppingItem else {return}
        imageView.image = UIImage(named: shoppingItem.name)
        name.text = shoppingItem.name
        hasAddedLabel.text = shoppingItem.hasAdded ? "Added" : "Not Added"
    }
    
}
