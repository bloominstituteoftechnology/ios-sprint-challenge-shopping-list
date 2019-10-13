//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_201 on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
//MARK: - Labels and ImageView from the "Collection View Controller" :
    
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
    @IBOutlet weak var itemImageViewOutlet: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
//MARK: - updateViews() function:
    
    func updateViews() {
        guard let newItem = shoppingItem else {return}
        itemNameLabel.text = newItem.name
        itemImageViewOutlet.image = UIImage(named: newItem.name)
        
        if newItem.isAdded == true {
            isAddedLabel.text = "Added"
            
        }else {
            isAddedLabel.text = "Not Added"
        }
    }
}
