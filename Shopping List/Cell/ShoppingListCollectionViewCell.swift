//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Donella Barcelo on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else { return }
        itemNameLabel.text = item.name
        let image = UIImage(named: item.name)
        itemImageView.image = image
        if item.addedToList == false {
            isAddedLabel.text = "Not Added"
        } else {
            isAddedLabel.text = "Added"
        }
    }
}
