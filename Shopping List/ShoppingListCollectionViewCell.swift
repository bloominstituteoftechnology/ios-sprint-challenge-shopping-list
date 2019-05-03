//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemAddedLabel: UILabel!
    
    func updateViews(){
        guard let photo = photo else { return }
        
        photoImageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
    
    
    
    
    
    
    
}
