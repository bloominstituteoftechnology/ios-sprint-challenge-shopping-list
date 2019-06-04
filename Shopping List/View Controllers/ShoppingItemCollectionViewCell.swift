//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    
    func isAddedToCart(on cell: ShoppingItemCollectionViewCell)
    
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        
        didSet {
            
            updateViews()
            
        }
        
    }
    
    
    
    weak var delegate: ShoppingItemCollectionViewCellDelegate?
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemAddedLabel: UILabel!
    
    func updateViews(){
        
        guard let shoppingItem = shoppingItem else {return}
        
        itemImage.image = shoppingItem.image
        
        itemName.text = shoppingItem.itemName
        
        
        if shoppingItem.addedToCart == true {
            itemAddedLabel.text = "Added To Cart"
        } else {
            itemAddedLabel.text = "Add"
            
        }
        
        delegate?.isAddedToCart(on: self)
        
        
    }
    
}
