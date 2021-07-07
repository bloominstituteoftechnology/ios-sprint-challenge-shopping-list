//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
 
    private func updateViews() {
        guard let shoppingItem = shoppingItem else {return}
        
        if shoppingItem.isAdded == true {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
        
        let itemImage = UIImage(named: shoppingItem.imageName)
        imageView.image = itemImage
        nameLabel.text = shoppingItem.name
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

}
