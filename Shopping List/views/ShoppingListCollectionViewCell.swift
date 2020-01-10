//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by LaFleur on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var hasBeenAddedTextLabel: UILabel! {
//        hasBeenAddedTextLabel.text = !hasBeenAddedTextLabel?.text
    }
        
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var itemTextLabel: UILabel!
    
     var delegate: itemDelegate?
           
        var shoppingItem: ShoppingItem? {
                didSet {
                    updateViews()
                }
            }
            private func updateViews() {
                guard let shoppingItem = shoppingItem,
                let image = UIImage(named: shoppingItem.name) else  { return }
                
            
                
                
                
    }
        @IBAction func itemTapped(_ sender: Any) {
            delegate?.itemTapped(shoppingItem: self)
        }
}
