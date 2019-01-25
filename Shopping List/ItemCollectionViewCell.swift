//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Vijay Das on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
  
    let userDefaults = UserDefaults.standard
    
    // outlets
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    
    // didSet
    // updateViews with userdefaults
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
            
        }
    }
    
    private func updateViews() {
        
        if let item = item {
            itemLabel.text = item.name
            
            guard let image = UIImage(named: item.image) else { return }
            
            itemImage.image = image
            
            if item.isAdded {
                addedLabel.text = "Added"
                
            } else {
                addedLabel.text = "Not Added"
            }
            
            let addedBool = item.isAdded
            
            userDefaults.set(addedBool, forKey: .isAddedToCartKey)
            
        
            
        }
        
        
        
    }
    
    
    
}
