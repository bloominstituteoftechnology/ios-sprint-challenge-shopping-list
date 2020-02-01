//
//  ListOfItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by Nichole Davidson on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ItemAddedButtonDelegate {
    
    func itemAddedTappedButton(_ item: ShoppingCart)
}

class ListOfItemsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    
    @IBOutlet weak var itemAddedButton: UIButton!
    
    @IBAction func itemAddedTappedButton(_ sender: Any) {
        
        guard let itemName = shoppingItemNameLabel.text,
            let addItem = shoppingItemNameLabel.text,
            !addItem.isEmpty else { return }
        
        let item = ShoppingCart(itemListed: itemName)
        
        if let addItem = shoppingItemNameLabel.text,
            !addItem.isEmpty {
            item.itemListed.append(addItem)
        }
        delegate?.itemAddedTappedButton(item)
    }
    
    var delegate: ItemAddedButtonDelegate?
    var items: [ShoppingCart] = []
    
    var shoppingItem: ShoppingCart? {
        didSet{
            updateViews()
        }
    }
    
//    func shoppingCart(nameOfItem: String) {
//        let item = ShoppingItem(nameOfItem: nameOfItem, imageName: image)
//        items.append(item)
//    }
    func updateViews() {
        
        guard let shoppingItem = shoppingItem else { return }
        
        if shoppingItem.itemListed {
            itemAddedButton.setTitle("Added", for: []);
            
        } else {
            itemAddedButton.setTitle("Not Added", for : [])
        }
      
        
//        shoppingItemImage.image = shoppingItem.image
//        shoppingItemNameLabel.text = shoppingItem.nameOfItem
        
        
    }
}
