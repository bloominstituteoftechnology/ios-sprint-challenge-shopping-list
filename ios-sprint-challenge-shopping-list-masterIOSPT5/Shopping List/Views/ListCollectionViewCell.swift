//
//  ListCollectionViewCell.swift
//  Shopping List
//
//  Created by David Williams on 2/23/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var delegate: ShoppingListDelegate?
    
    var items: Items? {
        didSet {
          updateViews()
        }
    }
    
    
    func updateViews() {
        guard let item = items else { return }
        if UserDefaults.standard.bool(forKey: .added) {
        addedLabel.text = "Tapped"
        }
    }
    
}
