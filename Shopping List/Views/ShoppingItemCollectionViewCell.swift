//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by alfredo on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//Update cell objects
class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    //MARK: -IBOutlets
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: -Properties
    
    var delegate: ShoppingItemCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: -Methods
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem, let image = UIImage(named: shoppingItem.name) else { return }
        
        var addedText = ""
        if shoppingItem.added {
            addedText = "Added"
        } else {
            addedText = "Not Added"
        }
        
        addedLabel.text = addedText
        imageView.image = image
        nameLabel.text = shoppingItem.name
    }
    
    //MARK: -IBActions
    
    @IBAction func itemTapped(_ sender: Any) {
        delegate?.ItemTapped(forItem: self)
    }

}
