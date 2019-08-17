//
//  GroceryItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var inCartStatusButton: UIButton!
    @IBOutlet weak var groceryItemImage: UIImageView!
    @IBOutlet weak var groceryItemName: UILabel!
    
    var buttonDelegate: GroceryItemCellDelegate?
    var index: IndexPath?
    
    var groceryItem: GroceryItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let groceryItem = groceryItem else { return }
        groceryItemName.text = groceryItem.name
        groceryItemImage.image = UIImage(named: groceryItem.name)
        if groceryItem.inCart == true {
            inCartStatusButton.setTitle("Added", for: .normal)
        } else if groceryItem.inCart == false {
            inCartStatusButton.setTitle("Not Added", for: .normal)
        }
    }
    
   
    @IBAction func toggleCartStatus(_ sender: Any) {
        guard let groceryItem = groceryItem else { return }
        var tempItem = groceryItem
        if groceryItem.inCart == true {
            inCartStatusButton.setTitle("Not Added", for: .normal)
            tempItem.inCart = false
            buttonDelegate?.toggleCartStatus(for: self)
        } else if groceryItem.inCart == false {
            inCartStatusButton.setTitle("Added", for: .normal)
            tempItem.inCart = true
            buttonDelegate?.toggleCartStatus(for: self)
        }
    }
    
    
}
