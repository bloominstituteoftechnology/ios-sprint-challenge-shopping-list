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
    
    //
    func reloadListView(){
        
        guard let groceryItem = groceryItem,
            let photo = UIImage(data: groceryItem.picture) else {return}
        
        groceryPhoto?.image = photo
        nameLabel?.text = groceryItem.name
        
        let addStatus = groceryItem.added ? "Added" : "Not Added"
        statusLabel?.text = addStatus
        
    } //End of function
    
    var groceryItem: ShoppingItem?{
        didSet{
            reloadListView() }
    }
    
    
} //End of itemProtoCell class

