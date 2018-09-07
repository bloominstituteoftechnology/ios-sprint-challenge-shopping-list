//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Moin Uddin on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        photoImageView?.image = UIImage(data: shoppingItem.imageData)
        itemLabel?.text = shoppingItem.item
        if shoppingItem.addedToList == true {
          addedLabel?.text = "Added"
        } else {
          addedLabel?.text = "Not Added"
        }
    
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
}
