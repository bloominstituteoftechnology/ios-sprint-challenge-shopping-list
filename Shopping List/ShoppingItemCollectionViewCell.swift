//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Aaron Cleveland on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var delegate: ShoppingItemCollectionViewCellDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }

    @IBAction func itemTapped(_ sender: Any) {
        delegate?.ItemTapped(forItem: self)
    }


    private func updateViews() {
        guard let shoppingItem = shoppingItem, let image = UIImage(named: shoppingItem.name) else { return }

        var addedText = ""
        if shoppingItem.added {
            addedText = "Added"
        } else {
            addedText = "Not Added"
        }

        addedLabel.text = addedText
        imageView.image = image
        nameLabel.text = shoppingItem.name
    }

}

