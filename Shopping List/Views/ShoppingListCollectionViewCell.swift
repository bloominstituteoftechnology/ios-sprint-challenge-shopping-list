//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
   
    
    func updateViews () {
        guard let item = item else {return }
        itemLabel.text = item.name
        let image = item.name
        itemImage.image = UIImage(named: image)!
        if item.hasBeenAdded == true {
            itemAddedLabel.text = "Added"
        } else {
            itemAddedLabel.text = "Not Added"
        }
    }
    
    
    var item: ShoppingItem? {
        didSet {
            updateViews ()
        }
    }
    
    @IBOutlet weak var itemAddedLabel: UILabel!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    
}
