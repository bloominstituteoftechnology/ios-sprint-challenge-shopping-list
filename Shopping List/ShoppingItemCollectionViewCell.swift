//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addedLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        
        guard let item = item else { return }
        
        nameLabel.text = item.name
        imageView.image = item.image ?? UIImage(named: "NoImage")
        if item.added {
            addedLabel.text = "Added"
        } else {
            addedLabel.text = "Not Added"
        }
    }
}
