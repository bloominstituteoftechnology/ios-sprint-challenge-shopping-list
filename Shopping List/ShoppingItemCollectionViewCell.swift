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
    
    
    @IBOutlet weak var isAddedLabel: UIButton!
    
    
    @IBOutlet weak var foodNameLabel: UILabel!
    
    
    //var listHelper: ListHelper?
    
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    @IBAction func isAddedButtonTapped(_ sender: UIButton) {
        delegate?.toggleHasBeenAdded(for: self)
       // updateViews()
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        foodNameLabel.text = shoppingItem.name
        itemImageView.image = shoppingItem.image
        
        let isAddedButton = shoppingItem.isAdded ? "Added" : "Not Added"
        isAddedLabel.setTitle(isAddedButton, for: .normal)
        
        
    }
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
}
