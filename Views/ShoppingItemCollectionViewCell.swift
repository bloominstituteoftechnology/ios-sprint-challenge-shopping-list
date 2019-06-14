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
        guard let itemCartStatus = shoppingItem?.isOnList else { return }
        if itemCartStatus == false {
            cartStatus.text = "Not Added"
        } else if itemCartStatus == true {
                cartStatus.text = "Added"
            }
        
    }
    

    
   
    
}
