//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        nameLabel.text = item.name
        imageView.image = item.image
        
        switch item.hasBeenAdded {
        case true:
            hasBeenAddedLabel.text = "Added"
        case false:
            hasBeenAddedLabel.text = "Not Added"
        }
    }
    
}
