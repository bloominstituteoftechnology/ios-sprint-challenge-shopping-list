//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Keri Levesque on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    var item: ShoppingItem? {
         didSet {
             updateView()
         }
     }
        func updateView() {
            guard let item = item else { return }
            nameLabel.text = item.name
            let image = item.name
            imageView.image = UIImage(named: image)!
            if item.addedToList == false {
                addedLabel.text = "Not Added"
            } else {
                addedLabel.text = "Added"
            }
        }
}
