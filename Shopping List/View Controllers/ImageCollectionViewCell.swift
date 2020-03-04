//
//  ImageCollectionViewCell.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingItemCellDelegate {
    func itemUpdated(item: ShoppingItem)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!

    var delegate: ShoppingItemCellDelegate?

    var item: ShoppingItem? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let shoppingList = item else { return }
               imageView.image = shoppingList.image
        itemNameLabel.text = shoppingList.name
        if shoppingList.didAdded == true {
                   addedLabel.text = "Added"
               }else{
                   addedLabel.text = "Not Added"
               }
    }

}
