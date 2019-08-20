//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddToShoppingListDelegate {
    func itemWasAdded(_ item: ShoppingItem)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    var delegate: AddToShoppingListDelegate?
    
    func updateViews() {
        guard let item = item else { return }
        nameLabel.text = item.name
        if item.added {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
    }
//    @IBAction func addedButtonPressed(_ sender: UIButton) {
//        guard let item = item else { return }
//        delegate?.itemWasAdded(item)
//        updateViews()
//    }
}
