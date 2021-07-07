//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let shoppingItemController = ShoppingItemController()
    var shoppingItem: ShoppingItem?
    
    // MARK: - Outlets
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel! {
        didSet { updateViews() }
    }
    
    func updateViews() {
        
        guard let name = shoppingItemNameLabel.text,
              let item = shoppingItem else { return }
        
        if name == item.name {
            if item.hasBeenAdded {
                self.statusLabel.text = "Added"
            } else {
                self.statusLabel.text = "Not Added"
            }
        }
    }
}
