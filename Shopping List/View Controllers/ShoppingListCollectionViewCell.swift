//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    var item: ShoppingItem? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var addedOrNotAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    // MARK: - ShoppingListCollectionViewCell
    func updateViews() {
        guard let item = self.item else { return }
        self.addedOrNotAddedLabel.text = item.addedToList ? "Added" : "Not Added"
        self.itemImageView.image = UIImage(data: item.imageData)
        self.itemNameLabel.text = item.name
    }

}
