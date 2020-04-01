//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            updateViews()
            
        }
    }
    
    func updateViews() {
        guard let item = shoppingItem else { return }
                imageView.image = UIImage(named: item.name)
                itemLabel.text = item.name

           if item.isAdded == false {
               isAddedLabel.text = "Add"
           } else {
               isAddedLabel.text = "Added"
           }
    }
}
