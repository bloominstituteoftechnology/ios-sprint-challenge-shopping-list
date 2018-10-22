//
//  itemCell.swift
//  Shopping List
//
//  Created by Lotanna Igwe-Odunze on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class itemProtoCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var groceryPhoto: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var groceryItem: ShoppingItem? { didSet { reloadListView() } }
    
    func reloadListView(){
        guard let groceryItem = groceryItem else {return}
        let photo = UIImage(named: groceryItem.pictureName)
        
        
        nameLabel.text? = groceryItem.name
        statusLabel.text? = groceryItem.added ? "Added" : "Not Added"
        
        groceryPhoto.image = photo
        nameLabel.text = groceryItem.name
        
    }
    
}
