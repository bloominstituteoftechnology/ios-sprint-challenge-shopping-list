//
//  CollectionViewCell.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        addedLabel.text = shoppingItem.isAdded ? "Added to cart" : "Not added"
        nameLabel.text = shoppingItem.itemName
//        imageView.image = UIImage(named: shoppingItem.imageName)
    }
        

}
