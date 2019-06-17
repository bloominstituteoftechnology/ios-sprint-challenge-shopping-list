//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Kat Milton on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var shoppingItemName: UILabel!
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var cartStatus: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    
    weak var delegate: ShoppingListCellDelegate?
    
    func updateViews() {
        shoppingItemName.text = shoppingItem?.name
        let status = shoppingItem!.isOnList ? "Added" : "Not Added"
        cartStatus.text = status
       
    }
    
    
    @IBAction func toggleCartStatus(_ sender: Any) {
        delegate?.toggleIfInShoppingCart(for: self)
        
    }
    

    
   
    
}
