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
    
    @IBOutlet weak var isAddedButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    var delegate: AddToShoppingListDelegate?
    
    func updateViews() {
        guard let item = item else { return }
        
        if item.added {
            isAddedButton.setTitle("Added", for: .normal)
        } else {
            isAddedButton.setTitle("Not Added", for: .normal)
        }
    }
    @IBAction func addedButtonPressed(_ sender: Any) {
        guard let item = item else { return }
        delegate?.itemWasAdded(item)
    }
}
