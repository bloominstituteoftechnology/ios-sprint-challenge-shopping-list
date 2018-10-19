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
    
    //Outlets here
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var groceryPhoto: UIImageView!
    
   
    var groceryItem: ShoppingItem?{ didSet{ reloadListView() }
    }
    
    //
    func reloadListView(){
        
        guard let groceryItem = groceryItem,
            let photo = UIImage(data: groceryItem.picture) else {return}
        
        groceryPhoto?.image = photo
        nameLabel?.text = groceryItem.name
        
        statusLabel?.text = groceryItem.added ? "Added" : "Not Added"
        
    } //End of function
    
    
} //End of itemProtoCell class
