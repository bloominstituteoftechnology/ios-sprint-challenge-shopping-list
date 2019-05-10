//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Steven Leyva on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    private func updateViews() {
        guard let shoppingListData = shoppingList?.imageData else { return }
        shoppingListImageView.image = UIImage(data: shoppingListData)
        shoppingListNameLabel.text = shoppingList?.title
        if shoppingList?.hasBeenAdded == true {
            print("added")
        } else {
            print("not added")
            
            func showAlert() {
                let alert = UIAlertController(title: "Delivery for Joe!" , message: "Your shopping Item will be delivered in 15 minutes", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
                showAlert()
            }
        }
    }
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate:ShoppingListCollectionViewCellDelegate?
    
    @IBAction func AddedButtonPressed(_ sender: Any) {
        delegate?.toggleHasBeenAdded(for: self)
    }
    @IBOutlet weak var shoppingListImageView: UIImageView!
    @IBOutlet weak var shoppingListNameLabel: UILabel!
}
