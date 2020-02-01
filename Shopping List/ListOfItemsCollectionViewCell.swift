//
//  ListOfItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ItemAddedButtonDelegate {
    
    func itemAddedTappedButton(cell: UICollectionViewCell)
}

class ListOfItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    
    @IBOutlet weak var itemAddedButton: UIButton!
    @IBAction func itemAddedTappedButton(_ sender: UIButton) {
            
        delegate?.itemAddedTappedButton(cell: self)
    }
    
    var delegate: ItemAddedButtonDelegate?
    
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    

    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        if shoppingItem.addedToList {
            itemAddedButton.setTitle("Added", for: [])
        } else {
            itemAddedButton.setTitle("Not Added", for : [])
        }
        
//        shoppingItemImage.image = shoppingItem.image
//        shoppingItemNameLabel.text = shoppingItem.nameOfItem
        
        
    }
}
