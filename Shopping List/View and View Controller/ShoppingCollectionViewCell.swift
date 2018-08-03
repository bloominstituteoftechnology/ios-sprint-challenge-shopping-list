//
//  ShoppingCollectionViewCell.swift
//  Shopping List
//
//  Created by Andrew Liao on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {
    
    
    func updateViews(){
        
        guard let shoppingItem = shoppingItem,
            let image = UIImage(data:shoppingItem.imageData) else {return}
        
        imageView?.image = image
        itemNameLabel?.text = shoppingItem.name
        
        let addedStatus = shoppingItem.isAdded ? "Added" : "Not Added"
        addedStatusLabel?.text = addedStatus

    }
    
    
    // MARK - Properties
    @IBOutlet weak var itemNameLabel: UILabel!

    @IBOutlet weak var addedStatusLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var shoppingItem:ShoppingItem?{
        didSet{
            updateViews()
        }
    }
}
