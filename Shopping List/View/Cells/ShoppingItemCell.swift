//
//  ShoppingItemCell.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCell: UICollectionViewCell {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Cell Configuration
    /// Function to configure the cell for display
    private func updateViews() {
        guard let item = item else { return }
        addedLabel.text = item.hasBeenAdded ? "Added" : "Not Added"
        itemImageView.image = UIImage(named: item.name)
        nameLabel.text = item.name
    }
}
