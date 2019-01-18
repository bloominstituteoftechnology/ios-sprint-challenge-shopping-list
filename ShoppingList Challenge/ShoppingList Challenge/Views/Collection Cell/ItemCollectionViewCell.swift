//
//  ItemCollectionViewCell.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

protocol ItemCollectionViewCellDelegate: class {
    func addStatusChanged(for cell: UICollectionViewCell)
}

class ItemCollectionViewCell: UICollectionViewCell {
    
    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    @IBOutlet weak var addButtonProperties: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    
    @IBAction func changeAddStatus(_ sender: UIButton) {
    delegate?.addStatusChanged(for: self)
        
    }
    
    func updateViews(){
        guard let passedInItem = item else { return }
        itemImage.image = passedInItem.image
        namelabel.text = passedInItem.item
        
        if passedInItem.isAdded {
            addButtonProperties.setTitle("Added", for: .normal)
        } else {
            addButtonProperties.setTitle("Not Added", for: .normal)
        }
    }
}
