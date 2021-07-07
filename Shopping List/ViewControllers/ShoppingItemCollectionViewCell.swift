//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var isInCartLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    
    var item: ShoppingItem? {
        didSet {
           updateViews()
        }
    }
    
    
    
    
    // update the cell
    func updateViews(){
        guard let item = item else {return}
        
        itemNameLabel.text = item.name
        isInCartLabel.text = item.isInList ? "Added" : "Not Added"
        itemImage.image = UIImage(data: item.image)
        
    
    }
    
    
    
    
}
