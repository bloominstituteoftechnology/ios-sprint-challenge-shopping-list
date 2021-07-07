//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 15/11/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    var tapCounter = 0
    
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let item = item else { return }
        itemImage.image = item.image
        itemLabel.text = item.name
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        tapCounter += 1
        
        if tapCounter % 2 == 1 {
            sender.setTitle("Added", for: .normal)
        } else {
            sender.setTitle("Not added", for: .normal)
        }
        
    }
}
