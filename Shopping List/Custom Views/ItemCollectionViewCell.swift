//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Ciara Beitel on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    func updateView() {
        guard let item = item else { return }
        addedLabel.text = "\(item.addedToList ? "Added" : "Add to list")"
        itemImage.image = UIImage(named: item.name)
        itemNameLabel.text = item.name
    }
}
