//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    let itemContoller = ShoppingItemController()
    var delegate: ShoppingItemDelegate?
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var hasBeenAddedLabel: UILabel!
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    
    private func updateViews() {
        shoppingItemNameLabel.text = item?.name
        shoppingItemImageView.image = item?.image
        
        switch item?.hasBeenAdded {
        case true:
            hasBeenAddedLabel.text = "Added"
        default:
            hasBeenAddedLabel.text = "Not Added"
        }
    }
    
    func ItemAdded() {
        collection
    }
}
