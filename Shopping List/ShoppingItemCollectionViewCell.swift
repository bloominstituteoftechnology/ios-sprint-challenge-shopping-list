//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Thomas Sabino-Benowitz on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var hasBeenAddedButton: UIButton!
    
    var delegate: ShoppingItemCollectionViewCellDelegate?
    
    
    
    var ShoppingItem: ShoppingItem? {
        didSet {
                   updateViews()
               }
           }
    
    
    private func updateViews() {
        guard var shoppingItem = ShoppingItem else {return}
        
        imageView.image = UIImage(named: shoppingItem.itemName)
        textLabel.text = shoppingItem.itemName
        
        if shoppingItem.hasBeenAdded {
            hasBeenAddedButton.setTitle("Added", for: .normal)
        } else {
            hasBeenAddedButton.setTitle("Not Added", for: .normal)
        }
    }
    @IBAction func hasBeenAddedTapped(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.toggleHasBeenAdded(for: self)
        
    }
}

