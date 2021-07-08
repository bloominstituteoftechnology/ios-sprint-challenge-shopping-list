//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

protocol ShoppingItemCollectionViewCellDelegate: AnyObject {
    func addedBtntoggled(on cell: UICollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    weak var shoppingCellDelegate: ShoppingItemCollectionViewCellDelegate?
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var shoppingListImageView: UIImageView!
    @IBOutlet weak var shoppingListItemLbl:   UILabel!
    @IBOutlet weak var addedBtn:              UIButton!
    
    @IBAction func addedBtnPressed(_ sender: UIButton) {
        shoppingCellDelegate?.addedBtntoggled(on: self)
        print("Btn Toggled")
    }
    
    func updateViews() {
        guard let newItem = shoppingItem else { return }
        if newItem.beenAdded {
            addedBtn.setTitle("ADDED", for: .normal)
        } else {
            addedBtn.setTitle(nil, for: .normal) // Maybe set to "" instead of nil?
        }
        guard let image = UIImage(named: newItem.name) else { return }
        shoppingListImageView.image = image
        shoppingListItemLbl.text = newItem.name
        
    }
    
}
