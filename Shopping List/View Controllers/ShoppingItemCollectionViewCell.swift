//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Nathan Hedgeman on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: class {
    func addedToCartTapped(on cell: ShoppingItemCollectionViewCell)
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
        
        itemName.self.text = shoppingItem.self?.itemName
        
        itemImage.self.image = UIImage(named: itemName.text!)
        
        guard let shoppingItem = shoppingItem else {return}
        
        if shoppingItem.addedToCart == true {
            itemAddedLabel.text = "Added To Cart"
        } else {
            itemAddedLabel.text = "Add To Cart"
            
        }
        
        
        
    }
    
}
