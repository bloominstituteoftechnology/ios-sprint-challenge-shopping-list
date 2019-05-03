//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Victor  on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemIsAdded: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    

    func updateViews() {
        guard let shoppingItem = shoppingItem else {
            return
        }
        if shoppingItem.isAddedToList {
            itemIsAdded.text = "Added"
        } else {
            itemIsAdded.text = "Not Added"
        }
        itemTitle.text = shoppingItem.title
        let image = UIImage(data: shoppingItem.imageData)
        itemImageView.image = image
    }
    
    
    
    
}
