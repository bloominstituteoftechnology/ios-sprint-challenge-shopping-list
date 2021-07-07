//
//  GroceryCollectionViewCell.swift
//  Shopping List
//
//  Created by Nathanael Youngren on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryCollectionViewCell: UICollectionViewCell {
    
    
    private func updateViews() {
        if let item = item {
            itemLabel.text = item.name
            
            guard let image = UIImage(named: item.image) else { return }
            
            itemImage.image = image

            if item.isAdded {
                addedLabel.text = "Added"
            } else {
                addedLabel.text = "Not Added"
            }
            
            let addedValue = item.isAdded
            
            UserDefaults.standard.set(addedValue, forKey: .isAddedToCartKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    var item: ShoppingItem? {
        didSet{ updateViews() }
    }
    
}
