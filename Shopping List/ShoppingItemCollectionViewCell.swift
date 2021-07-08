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
    
    //properties
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemIsAdded: UILabel!
    
    //updates views
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    

    func updateViews() {
        guard let shoppingItem = shoppingItem else {return}
        itemTitle.text? = shoppingItem.name
        itemIsAdded.text? = shoppingItem.isAddedToList ? "Added" : "Not Added"
        let itemImage = UIImage(named: shoppingItem.title)
        itemImageView.image = itemImage
    }
    
    
    
}
