//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Paul Yi on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    var shoppingItem: ShoppingItem? {
        didSet {
           updateViews()
        }
    }
    
    @IBOutlet weak var addedNotAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        imageView?.image = UIImage(data: shoppingItem.imageData)
        nameLabel?.text = shoppingItem.name
        
        if shoppingItem.isAdded == true {
            addedNotAddedLabel.text = "Added!"
            addedNotAddedLabel.textColor = .green
        } else {
            addedNotAddedLabel.text = "Not Added"
            addedNotAddedLabel.textColor = .black
        }
    }
    
}
