//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelAdded: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateVisuals()
        }
    }
    
    func updateVisuals() {
        //Item Added?
        if shoppingItem?.inShoppingList == true {
            labelAdded.text = "Added"
        } else {
            labelAdded.text = "Not Added"
        }
        
        labelName.text = shoppingItem?.name.rawValue
        imageView.image = shoppingItem?.image
    }
    
}
