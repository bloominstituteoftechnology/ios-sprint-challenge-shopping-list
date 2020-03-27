//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Hunter Oppel on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var didAddLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingItem = shoppingItem else {return}
        if shoppingItem.didAdd{
            didAddLabel.text = "Added"
        } else {
            didAddLabel.text = "Not Added"
        }
        imageView.image = shoppingItem.image
        nameLabel.text = shoppingItem.name
    }
}
