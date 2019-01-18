//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Nelson Gonzalez on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var notAddedButton: UIButton!
    
    
    var shopping: Shopping? {
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let shopping = shopping else {return}
        nameLabel.text = shopping.name
        let image = UIImage(named: shopping.image)
        itemImageView.image = image
        let hasBeenAddedName = shopping.hasBeenAdded ? "Added" : "Not Added"
        notAddedButton.setTitle(hasBeenAddedName, for: .normal)
    }
    
    
    @IBAction func notAddedPressed(_ sender: UIButton) {
    }
    
}
