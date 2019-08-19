//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Casualty on 8/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        itemImage.image = UIImage(named: item?.image ?? "")
        
        itemNameLabel.text = item?.name
        
            
        }


    
}
