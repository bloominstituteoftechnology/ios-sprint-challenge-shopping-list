//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Conner on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    func updateViews() {
        if shoppingItem.addedToList {
            shoppingItemAddedLabel?.text = "Added"
        } else {
            shoppingItemAddedLabel?.text = "Not Added"
        }
    }

    @IBAction func toggleAdd(_ sender: Any) {
        delegate?.toggleAddedToList(for: self)
    }

    @IBOutlet var shoppingItemAddedLabel: UILabel!
    @IBOutlet var shoppingItemLabel: UILabel!
    @IBOutlet var shoppingItemImageView: UIImageView!

    var shoppingItem: ShoppingItem! {
        didSet {
            updateViews()
        }
    }

    weak var delegate: ShoppingItemCollectionCellDelegate?
}
