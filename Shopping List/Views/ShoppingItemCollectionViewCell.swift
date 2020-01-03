//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    


    var delegate: itemInitializedDelegate?
       
    var shoppingItem: ShoppingItem? {
            didSet {
                updateViews()
            }
        }
        private func updateViews() {
            guard let shoppingItem = shoppingItem,
            let image = UIImage(named: shoppingItem.name) else  { return }
            
             statusLabel.text = ""
            if shoppingItem.addedToList {
                statusLabel.text = "Added"
            } else {
                statusLabel.text = "Not Added"
            }
            
            statusLabel.text = statusLabel.text
            itemImage.image = image
            productName.text = shoppingItem.name
            
}
    @IBAction func itemTapped(_ sender: Any) {
        delegate?.itemTapped(shoppingItem: self)
    }

}
