//
//  ShopingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lydia Zhang on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShopingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isAddded: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var shoppingItems: ShoppingItems? {
        didSet{
            updateViews()
        }
    }
    private func updateViews() {
        guard let shoppingItems = shoppingItems else {
            return
        }
        imageView.image = UIImage(data: shoppingItems.imageData)
        itemNameLabel.text = shoppingItems.title
        if shoppingItems.isAdded == false {
            isAddded.text = "Not Added"
        } else {
            isAddded.text = "Added"
        }
    }
}
