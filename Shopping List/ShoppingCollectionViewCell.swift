//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var addedLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else {return}
        
        nameLabel.text = item.name
        imageView.image = item.image ?? UIImage(named: "NoImage")
        
        if item.added {
            addedLabel.text = "Added"
        } else {
            addedLabel.text = "Not Added"
        }
        
        
    }
    
    
    
}
