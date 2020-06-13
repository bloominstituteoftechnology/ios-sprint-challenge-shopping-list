//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Cora Jacobson on 6/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!

    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let item = item {
            nameLabel.text = item.name
            itemImageView.image = UIImage(named: item.imageName)
            if item.addedToList == true {
                addedToListButton.setTitle("Added", for: .normal)
            } else {
                addedToListButton.setTitle("Not Added", for: .normal)
            }
            
        }
    }
}
