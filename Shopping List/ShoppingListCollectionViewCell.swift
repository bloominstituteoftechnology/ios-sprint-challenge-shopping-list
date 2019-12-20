//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by user162867 on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedOrNotLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = shoppingItem else {return}
        if item.added {
            addedOrNotLabel.text = "Added"
        } else {
            addedOrNotLabel.text = "Not Added"
        }
        imageView.image = UIImage(named: item.name )
        label.text = item.name
    }
}
