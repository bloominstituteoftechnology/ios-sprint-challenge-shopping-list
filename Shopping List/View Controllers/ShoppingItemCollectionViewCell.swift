//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var shoppingItemController: ShoppingItemController?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var addOrRemoveButton: UIButton!
    
    // MARK: IBActions
    @IBAction func addOrRemove(_ sender: Any?) {
        guard let shoppingItemController = shoppingItemController,
            let shoppingItem = shoppingItem else { return }
        shoppingItemController.toggleItemSelected(shoppingItem: shoppingItem)
//        let button = UIButton()
//             if button.isSelected {
//                 button.setTitle("Remove", for: .normal)
//                 button.setTitleColor(.red, for: .normal)
//                shoppingItem?.itemSelected = false
//             } else {
//                 button.setTitle("Add", for: .normal)
//                 button.setTitleColor(.blue, for: .normal)
//                shoppingItem?.itemSelected = true
//             }
         }
    
    func updateViews() {
        shoppingItemImage.image = shoppingItem?.image
        shoppingItemLabel.text = shoppingItem?.name
        guard let isItemSelected = shoppingItem?.itemSelected else { return }
        let buttonTitle = isItemSelected ? "Remove" : "Add"
        addOrRemoveButton.setTitle(buttonTitle, for: .normal)
            
    }
}


