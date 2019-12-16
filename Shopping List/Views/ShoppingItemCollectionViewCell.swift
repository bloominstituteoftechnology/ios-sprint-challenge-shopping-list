//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Joshua Rutkowski on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var addedItemLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    
    var delegate: ShoppingItemCollectionViewCellDelegate?
        var shoppingItem: ShoppingItem? {
            didSet {
                updateViews()
            }
        }
        
        
        private func updateViews() {
            guard let shoppingItem = shoppingItem, let image = UIImage(named: shoppingItem.name) else { return }
            
            var addedText = ""
            if shoppingItem.added {
                addedText = "Added"
            } else {
                addedText = "Not Added"
            }
            
            addedItemLabel.text = addedText
            imageView.image = image
            itemLabel.text = shoppingItem.name
        }
    //MARK: - IBActions
    
    @IBAction func itemTapped(_ sender: Any) {
        delegate?.ItemTapped(forItem: self)
    }
    
        
    }
