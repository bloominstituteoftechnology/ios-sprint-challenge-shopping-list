//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Chad Parker on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!

    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let item = item else { return }
        addedLabel.text = item.addedToList ? "Added" : "Not Added"
        addedLabel.alpha = item.addedToList ? 1.0 : 0.3
        imageView.image = item.image
        itemNameLabel.text = item.name
    }

    @IBAction func overlayButtonWasTapped(_ sender: UIButton) {
        item?.addedToList.toggle()
    }
}
