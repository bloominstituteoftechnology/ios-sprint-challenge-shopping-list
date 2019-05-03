//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Sameera Roussi on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

extension String {
    static let groceryCell = "GroceryCell"
}

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets and Properties
    
    @IBOutlet weak var itemView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
}
