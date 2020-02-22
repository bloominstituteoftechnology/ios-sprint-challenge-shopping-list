//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Matthew Martindale on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var addedToCartImage: UIImageView!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let addedToCart = shoppingItem?.hasBeenAddedToCart else { return }
        let image = addedToCart ? UIImage(named: "checkmarkFull")! : UIImage(named: "emptyCheckmark")!
        addedToCartImage.image = image
        itemImage.image = shoppingItem?.itemImage
        itemLabel.text = shoppingItem?.name
    }
}
