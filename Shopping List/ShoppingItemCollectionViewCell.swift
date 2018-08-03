//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let name = shoppingItem?.name,
            let imageData = shoppingItem?.imageData,
            let image = UIImage(data: imageData) else {
                return
        }
        shoppingItemLabel.text = name
        shoppingItemImageView.image = image
    }
    
    // MARK: - Properties
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    
}
