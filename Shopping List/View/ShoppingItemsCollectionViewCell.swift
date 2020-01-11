//
//  ShoppingItemsCollectionViewCell.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsCollectionViewCell: UICollectionViewCell {
    
    //ib outlets
    
    @IBOutlet weak var addedNotAddedLbl: UILabel!
    @IBOutlet weak var groceryItemImg: UIImageView!
    @IBOutlet weak var groceryItemName: UILabel!
    
    var delegate: ShoppingListDelegate?
    var shoppingItem: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = shoppingItem else { return }
        if item.hasBeenAddedToList {
            addedNotAddedLbl.text = "Added"
        } else {
            addedNotAddedLbl.text = "Not Added"
        }
        groceryItemImg.image = UIImage(named: item.name)
        groceryItemName.text = item.name

}
            
   }

 
