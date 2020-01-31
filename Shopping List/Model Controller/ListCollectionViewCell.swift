//
//  ListCollectionViewCell.swift
//  Shopping List
//
//  Created by beth on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    func updateViews() {
        guard let item = item else { return }
        nameLabel.text = item.name
        let image = item.name
        shoppingItem.image = UIImage(named: image)!
        if item.hasBeenAdded == true {
            itemAddedLabel.text = "Added"
        } else {
            itemAddedLabel.text = "Not Added"
        }
    }
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var itemAddedLabel: UILabel!
    @IBOutlet weak var shoppingItem: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
}
