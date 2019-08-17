//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Joel Groomer on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblItemName: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else { return }
        if item.inShoppingList {
            imgItem.image = UIImage(named: item.selectedImage)
        } else {
            imgItem.image = UIImage(named: item.image)
        }
        lblItemName.text = item.name
    }
}
