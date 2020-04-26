//
//  ListCollectionViewCell.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    var delegate: ShoppingListDelegate?
    
    var items: Items? {
        didSet {
            
        }
    }
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
     
    func updateViews() {
        guard let item = items else { return }
        if UserDefaults.standard.bool(forKey: .added) {
        addedLabel.text = "Tapped"
        }
    }
    
}
