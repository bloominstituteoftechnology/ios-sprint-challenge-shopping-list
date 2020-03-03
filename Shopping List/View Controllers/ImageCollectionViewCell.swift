//
//  ImageCollectionViewCell.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCellDelegate {
    func itemUpdated(item: ShoppingItem)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!

    var delegate: ShoppingItemCellDelegate?

    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let item = item else { return }
        addedLabel.text = item.didAdded ? "Added" : "Not Added"
        addedLabel.alpha = item.didAdded ? 1.0 : 0.3
        imageView.image = item.image
        itemNameLabel.text = item.name
    }

    @IBAction func overlayButtonWasTapped(_ sender: UIButton) {
        item?.didAdded.toggle()
        if let item = item {
            delegate?.itemUpdated(item: item)
        }
    }
}
