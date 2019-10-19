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
    
    var shoppingListController: ShoppingListController?
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let item = item else { return }
        var booleanValue = item.hasBeenAdded
        
        itemName.text = item.name
        imageView.image = UIImage(named: item.name)
        
        if booleanValue {
            hasBeenAdded.text = "Added"
        } else {
            hasBeenAdded.text = "Not Added"
        }

    }
    
    @IBAction func hasBeenAddedTapped(_ sender: UIButton) {
        item?.hasBeenAdded.toggle()
        updateViews()
    }
    
    
}
