//
//  ShoppingItemCollectionViewCell.swift
//  Shopping List
//
//  Created by Jon Bash on 2019-10-18.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: ShoppingListCollectionViewController?
    var shoppingItemController: ShoppingItemController?
    
    var shoppingItem: ShoppingItem? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    //@IBOutlet weak var addedButton: UIButton!
    @IBOutlet weak var addedLabel: UILabel!
    
    func updateViews() {
        guard let item = shoppingItem else {
            print("error; cell has no item!")
            return
        }
        
        image.image = UIImage(named: item.name)
        nameLabel.text = item.name
        addedLabel.text = item.added ? "Added" : "Not added"
        shoppingItemController?.update(item: item, to: item.added)
        //delegate?.collectionView.reloadData()
    }
    
//    @IBAction func addedButtonTapped(_ sender: UIButton) {
//        addItemToCart()
//    }
    
    func addItemToCart() {
        shoppingItem?.added.toggle()
        updateViews()
    }
    
}
