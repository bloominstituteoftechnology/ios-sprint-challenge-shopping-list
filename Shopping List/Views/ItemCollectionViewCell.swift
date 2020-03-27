//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Cameron Collins on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelAdded: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        labelName.text = item?.name

        if item?.hasBeenAdded == true
        {
            labelAdded.text = "Added"
        } else {
            labelAdded.text = "Not Added"
        }
        
        imageView.image = item?.image
    }
    
    
}
