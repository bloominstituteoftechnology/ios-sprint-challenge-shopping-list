//
//  GroceryCollectionViewCell.swift
//  Shopping List
//
//  Created by Jake Connerly on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol GroceryCollectionViewCellDelegate: class {
    func addedButtonWasTapped(on cell: GroceryCollectionViewCell)
}

class GroceryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedButton: UIButton!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    weak var delegate: GroceryCollectionViewCellDelegate?
    
    var groceryItem: GroceryItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func addedButtonTapped(_ sender: UIButton) {
        self.delegate?.addedButtonWasTapped(on: self)
        guard let item = groceryItem else {return}
        let userDefaults = UserDefaults.standard
        if item.hasBeenAdded == true {
            userDefaults.set(true, forKey: .added)
        }else {
            userDefaults.set(false, forKey: .added)
        }
    }
    
    func updateViews() {
        guard let item = groceryItem else { return }
        let userDefaults = UserDefaults.standard
        itemImageView.image = item.itemImage
        itemNameLabel.text = item.itemName
        
        let addedChoice = userDefaults.bool(forKey: .added)
        
        if addedChoice == true {
            addedButton.setTitle("Added", for: .normal)
        }else {
            addedButton.setTitle("Not Added", for: .normal)
        }
    }
    
}
