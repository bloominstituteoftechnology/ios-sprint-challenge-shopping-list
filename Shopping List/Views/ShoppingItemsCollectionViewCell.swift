//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Mike Nichols on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCellDelegate: class {
    func itemSelected(_ cell: ShoppingItemsCollectionViewCell)

}

class ShoppingItemsCollectionViewCell: UICollectionViewCell, ShoppingListCellDelegate {
    
    var delegate: ShoppingListDelegate?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isOnListButton: UIButton!
    
    func itemSelected(_ cell: ShoppingItemsCollectionViewCell) {
        if cell.isOnListButton.isSelected == true {
            cell.isOnListButton.isSelected = false
            
        } else {
            cell.isOnListButton.isSelected = true
        }
        delegate?.saveToPersistentStore()
    }
}
