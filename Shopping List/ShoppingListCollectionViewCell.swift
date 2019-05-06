//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
protocol ShoppingListCollectionViewCellDelegate {
    func toggleHasBeenAdded(for cell: ShoppingListCollectionViewCell)
}

import UIKit


class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem?{
        didSet{
            print("item was recieved")
            updateViews()

        }
    }
    var delegate: ShoppingListCollectionViewCellDelegate?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemAddedLabel: UIButton!
    
    @IBAction func addItemButtonPressed(_ sender: UIButton) {
        delegate?.toggleHasBeenAdded(for: self)
        
    }
    func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        imageView.image = shoppingItem.image
        nameLabel.text = shoppingItem.name
        
        if shoppingItem.added == true {
            itemAddedLabel.setTitle("Added", for: .normal)
            itemAddedLabel.setTitleColor(.green, for: .normal)
            
        } else {
            itemAddedLabel.setTitle("Not Added", for: .normal)
            itemAddedLabel.setTitleColor(.red, for: .normal)
        }
        
    }
}
