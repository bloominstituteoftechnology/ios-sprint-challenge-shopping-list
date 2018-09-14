//
//  ShoppingListCollectionViewCell.swift
//  Shopping List
//
//  Created by Ilgar Ilyasov on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol ShoppingListCollectionViewCellDelegate: class {
    func heyItemAddedToList(for cell: ShoppingListCollectionViewCell)
}

class ShoppingListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var shoppingListController: ShoppingItemController?
    
    weak var shoppingListCVCellDelegate: ShoppingListCollectionViewCellDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var shoppingItemImage: UIImageView!
    @IBOutlet weak var shoppingItemNameLabel: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
}
