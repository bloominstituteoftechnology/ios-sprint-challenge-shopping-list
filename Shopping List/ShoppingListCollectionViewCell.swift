//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
    guard let shoppingListData = shoppingList?.imageData  else { return }
    imageView.image = UIImage(data: shoppingListData)
    shoppingListNameLabel.text = shoppingList?.title
    
}

var shoppingList: ShoppingList? {
    didSet {
        updateViews()
    }
}

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var shoppingListNameLabel: UILabel!
    @IBAction func notAddedbuttonPressed(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
    }
    
    private func updateViews() {
        guard let shoppingList = shoppingList else { return }
        
        shoppingListNameLabel.text = shoppingList.title
        if shoppingList.hasBeenAdded == true {
            notAddedbuttonPressed.setImage(UIImage(named: "Added"), for: .normal)
        } else {
            notAddedbuttonPressed.setImage(UIImage(named: "Not Added"), for: .normal)
        }
    }    }

