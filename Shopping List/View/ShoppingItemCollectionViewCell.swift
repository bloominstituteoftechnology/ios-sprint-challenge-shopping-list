//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Fabiola S on 8/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var addedButton: UIButton!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard  let item = item else { return }
        
        itemImageView.image = UIImage(data: item.itemImage)
        itemNameLabel.text = item.itemName
    }
    
    @IBAction func addedButton(_ sender: UIButton) {
        if sender.titleLabel?.text == "Not Added" {
            sender.titleLabel?.text = "Added"
        }
    }
    
    
    
}
