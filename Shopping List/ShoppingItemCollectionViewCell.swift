//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Moses Robinson on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        addedLabel.text = shoppingItem.isAdded ? "Added" : "Not Added"
        imageView.image = UIImage(data: shoppingItem.image)
        itemNameLabel.text = shoppingItem.name
    }
    
    //MARK: - Properties
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
}
