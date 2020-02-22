//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jarren Campos on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

    //MARK: IBOutlets
    @IBOutlet var addedLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    func updateViews() {
        guard let item = item else { return }
        nameLabel.text = item.name
        let image = item.name
        imageView.image = UIImage(named: image)!
        if item.addedItem == true {
            addedLabel.text = "Added"
            addedLabel.textColor = .green
            
        } else {
            addedLabel.text = "Not Added"
            addedLabel.textColor = .red
        }
    }
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
}
