//
//  GroceryItemCollectionViewCell.swift
//  Shopping List
//
//  Created by brian vilchez on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var groceryItemImage: UIImageView!
    @IBOutlet weak var groceryItemNameLAbel:UILabel!
    @IBOutlet weak var hasBeenAddedButton: UIButton!
    
    @IBAction func hasBeenAddedTapped(_ sender: Any ) {
        delegate?.togglehasBeenAdded(for: self)
    }
    
    var delegate: GroceryItemCellDelegate?
    var groceryItem: GroceryItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
      guard let groceryItem = groceryItem else {return}
        groceryItemImage.image = UIImage(data: groceryItem.groceryItemImage)
        groceryItemNameLAbel.text = groceryItem.GroceryItem
            let added = groceryItem.hasBeenAdded ? "Added": "not Added"
            hasBeenAddedButton.setTitle(added, for: .normal)
    }
  
}
