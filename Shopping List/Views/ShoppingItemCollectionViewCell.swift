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
    @IBOutlet weak var addedButton: UIButton!
    
    func updateViews() {
        guard let item = shoppingItem else {
            print("error; cell has no item!")
            return
        }
        
        let addedString = item.added ? "Added" : "Not added"
        
        image.image = UIImage(named: item.name)
        nameLabel.text = item.name
        addedButton.setTitle(addedString, for: .normal)
        shoppingItemController?.update(item: item, to: item.added)
        //delegate?.collectionView.reloadData()
    }
    
    override func select(_ sender: Any?) {
        add()
    }
    
    @IBAction func addedButtonTapped(_ sender: UIButton) {
        add()
    }
    
    private func add() {
        shoppingItem?.added.toggle()
        updateViews()
    }
    
}
