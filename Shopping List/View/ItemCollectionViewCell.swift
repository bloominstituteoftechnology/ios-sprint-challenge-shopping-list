//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Karen Rodriguez on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var isAddedLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else {return}
        
        if item.isAdded {
            isAddedLabel.text = "Added"
        } else {
            isAddedLabel.text = "Not Added"
        }
        
        itemImageView.image = UIImage(data: item.imageData)
        
        nameLabel.text = item.name


    }
}
