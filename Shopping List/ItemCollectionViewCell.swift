//
//  ItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Sherene Fearon on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit


protocol HasBeenAddedDelegate {
    func beenAddedTapped(cell: ItemCollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: HasBeenAddedDelegate?
    
    var shoppingItem: ShoppingItem? {
        didSet{
            updateViews()
        }
    }
   
    
    
    @IBOutlet weak var addedButton: UIButton!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    

    @IBAction func foodItemAdd(_ sender: Any) {
        delegate?.beenAddedTapped(cell: self)
    }
    
    private func updateViews() {
        guard let shoppingItem = shoppingItem else { return }
        if shoppingItem.beenAdded == true {
            addedButton.setTitle("Added", for: .normal)
        } else {
            addedButton.setTitle("Not Added", for: .normal)
        }
    }
}





