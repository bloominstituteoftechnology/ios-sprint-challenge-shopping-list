//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties and Outlets
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Loading Methods
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        itemImage.image = UIImage(named: shoppingItem.image)
        itemLabel.text = shoppingItem.item
        
        if shoppingItem.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
    }
}
