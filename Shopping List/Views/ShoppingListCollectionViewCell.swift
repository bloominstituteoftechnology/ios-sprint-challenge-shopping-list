//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Morgan Smith on 12/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    @IBAction func addItem(_ sender: UIButton) {
       delegate?.toggleHasBeenAdded(cell: self)
    }
    
    func updateViews () {
        guard let item = item else {return }
        itemLabel.text = item.name
        let image = item.name
        itemImage.image = UIImage(named: image)!
        if item.hasBeenAdded == true {
        itemButton.setTitle("Added", for: .normal)
        }
     
    }
    
    weak var delegate: ShoppingListDelegate?
    
    var item: ShoppingItem? {
        didSet {
            updateViews ()
        }
    }
    

    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemButton: UIButton!
    
}
