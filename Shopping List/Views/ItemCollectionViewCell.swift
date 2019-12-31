//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    


    var delegate: itemInitializedDelegate?
        var itemName: ShoppingItem? {
            didSet {
                updateViews()
            }
        }
        private func updateViews() {
            guard let itemName = itemName,
            let image = UIImage(named: itemName.name) else  { return }
            
            var text = ""
            if itemName.addedToList {
                text = "Added"
            } else {
                text = "Not Added"
            }
            
            statusLabel.text = text
            itemImage.image = image
            productName.text = itemName.name
            
    }
    
}
//    @IBAction func itemTapped(_ sender: Any) {
//        delegate?.itemTapped(item: self)
//    }
//
//}


