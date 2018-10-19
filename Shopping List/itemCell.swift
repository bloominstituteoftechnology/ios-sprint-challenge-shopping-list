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
        
        guard let mygrocery = self.groceryItem,
            let photo = UIImage(data: mygrocery.picture) else {return}
        
        groceryPhoto?.image = photo
        nameLabel?.text = mygrocery.name
        
        let addStatus = mygrocery.added ? "Added" : "Not Added"
        statusLabel?.text = addStatus
        
    } //End of function
    
    var groceryItem: ShoppingItem?{
        didSet{
            reloadListView() }
    }
    
    
} //End of itemProtoCell class

