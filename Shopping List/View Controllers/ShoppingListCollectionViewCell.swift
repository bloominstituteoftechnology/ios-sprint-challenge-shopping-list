//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Shawn James on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    // MARK: - Methods
    func updateViews() {
        if let item = shoppingItem {
            imageView.image = UIImage(named: item.name)
            nameLabel.text = item.name
            if item.added { addedLabel.text = "Added" }
            else { addedLabel.text = "+ Add" }
        }
    }
    
}

