//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jessie Ann Griffin on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var item: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        
        if item.added {
            textLabel.text = "Added"
        } else {
            textLabel.text = "Not Added"
        }
    }
}
