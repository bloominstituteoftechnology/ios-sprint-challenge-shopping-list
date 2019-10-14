//
//  ShoppingItemCollectionViewCell.swift
//  ios-sprint-challenge-shopping-list
//
//  Created by Nicolas Rios on 10/13/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//



import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
//MARK: - Labels and ImageView from the "Collection View Controller" :
    
    
    @IBOutlet weak var isAddedLabel: UILabel!
    
    @IBOutlet weak var PictureViewOutlet: UIImageView!
    
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
        PictureViewOutlet.image = UIImage(named: newItem.name)
        
        if newItem.isAdded == true {
            isAddedLabel.text = "Added"
            
        }else {
            isAddedLabel.text = "Not Added"
        }
    }
}

