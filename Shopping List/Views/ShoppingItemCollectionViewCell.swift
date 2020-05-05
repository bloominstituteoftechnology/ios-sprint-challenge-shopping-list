//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Aaron Peterson on 5/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol CellSelectionDelegate {
    func updateIsAddedLabel(cell: ShoppingItemCollectionViewCell)
}

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: CellSelectionDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var shoppingItemImageView: UIImageView!
    @IBOutlet weak var shoppingItemLabel: UILabel!
    @IBOutlet weak var isAddedButton: UIButton!
    
    @IBAction func isAddedButtonTapped(_ sender: Any) {
        delegate?.updateIsAddedLabel(cell: self)
    }
    
    
}
