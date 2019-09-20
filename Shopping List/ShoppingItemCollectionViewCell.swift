//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Isaac Lyons on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        addedLabel.text = "\(shoppingItem.onList ? "" : "Not ")Added"
        imageView.image = UIImage(named: shoppingItem.name)
        nameLabel.text = shoppingItem.name
    }
    
}
