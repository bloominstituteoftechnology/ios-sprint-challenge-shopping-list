//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jocelyn Stuart on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
   // weak var delegate: BookTableViewCellDelegate?
    
   
  /*  @IBAction func checkBoxTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    } */
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        foodNameLabel.text = shoppingItem.name
        itemImageView.image = shoppingItem.image
        
        let isAddedButton = shoppingItem.isAdded ? "Added" : "Not Added"
        isAddedLabel.text = isAddedButton
        
    }
    
    
}
