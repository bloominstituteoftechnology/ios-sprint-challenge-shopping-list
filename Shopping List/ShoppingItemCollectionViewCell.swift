//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Ufuk Türközü on 20.12.19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingListController = ShoppingListController()
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addTapped(_ sender: Any) {
        addItem()
    }
    
    func updateViews(){
        guard let shoppingItem = shoppingItem else { return }
        itemImage.image = shoppingItem.itemImage
        itemName.text = shoppingItem.itemName
        
        
    }
    
    func addItem() {
        
              if addButton.currentTitle == "add" {
                  addButton.setTitle("added", for: .normal)
                shoppingItem?.hasBeenAdded = false
              } else {
              addButton.setTitle("add", for: .normal)
                  shoppingItem?.hasBeenAdded = true
              }
        
        for item in shoppingListController.shoppingList {
            if item.hasBeenAdded == true {
                shoppingListController.selectedItems.append(item)
            }
        }
    }
}
