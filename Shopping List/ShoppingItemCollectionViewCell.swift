//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCellDelegate: class {
    func toggleHasBeenRead(for cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    
    @IBOutlet weak var hasBeenAddedButton: UIButton!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ShoppingItemCellDelegate?
    
    
    @IBAction func hasBeenButtonTapped(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
        print("touched")
    }
    
//    
//    func hasBeenTapped() {
//        delegate?.toggleHasBeenRead(for: self)
//    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        
        shoppingItemNameLabel.text = shoppingItem.name
        imageView.image = shoppingItem.image
        if !shoppingItem.isAdded {
            hasBeenAddedLabel.text = "Not Added"
        } else {
            hasBeenAddedLabel.text = "Added"
        }
        #warning("this else might not be necessary")
        
    }
}
