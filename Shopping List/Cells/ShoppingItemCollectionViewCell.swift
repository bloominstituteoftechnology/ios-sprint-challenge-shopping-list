//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Waseem Idelbi on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    //MARK: -IBOutlets and IBActions-
    
    @IBAction func ItemWasAddedButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBOutlet var itemWasAddedLabel: UILabel!
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemName: UILabel!
    
    
    //MARK: -Important properties-
    
    var item: Item? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: -Important methods-
    
    func updateViews() {
        guard let item = item else {return}
        itemName.text = item.name
        itemImage.image = UIImage(named: item.name)
        
        if item.itemWasAdded {
            itemWasAddedLabel.text = "Added"
        } else {
            itemWasAddedLabel.text = "Not Added"
        }
    }
    
    
}//End of class
