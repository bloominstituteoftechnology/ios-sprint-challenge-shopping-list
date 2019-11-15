//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 15/11/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
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
        sender.setTitle("Added", for: .normal)
    }
    
}
