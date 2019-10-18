//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Niranjan Kumar on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hasBeenAdded: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    var delegate: ShoppingListCollectionViewController?
    var shoppingListController: ShoppingListController?
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    private func updateViews() {
        guard let item = item else { return }
        
        itemName.text = item.name
        imageView.image = UIImage(named: item.name)
        shoppingListController?.updateHasBeenAdded(item)
        if item.hasBeenAdded {
        hasBeenAdded.text = "Added"
        } else {
        hasBeenAdded.text = "Not Added"
        }
    }
    
}
