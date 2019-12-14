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
    
    var item: ShoppingItem? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let item = item else { return }
        groceryItemName.text = item.name
        let image = UIImage(named: item.name)
        groceryItemImg.image = image
        if item.hasBeenAddedToList == false {
            addedNotAddedLbl.text = "Not Added"
        } else {
            addedNotAddedLbl.text = "Added"
        }
    }
    
}
