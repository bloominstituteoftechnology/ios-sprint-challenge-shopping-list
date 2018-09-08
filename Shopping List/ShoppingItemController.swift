//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Farhan on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit
import Photos

class ShoppingItemController {
    

    var items: [ShoppingItem] = [ShoppingItem(name: "Apple", image: UIImagePNGRepresentation(UIImage(named: "apple")!)!, isSelected: true ),
                 ShoppingItem(name: "Grapes", image: UIImagePNGRepresentation(UIImage(named: "grapes")!)!, isSelected: true ),
    ShoppingItem(name: "Milk", image: UIImagePNGRepresentation(UIImage(named: "milk")!)!, isSelected: true ),
    ShoppingItem(name: "Muffin", image: UIImagePNGRepresentation(UIImage(named: "muffin")!)!, isSelected: true ),
    ShoppingItem(name: "Popcorn", image: UIImagePNGRepresentation(UIImage(named: "popcorn")!)!, isSelected: true ),
    ShoppingItem(name: "Soda", image: UIImagePNGRepresentation(UIImage(named: "soda")!)!, isSelected: true ),
    ShoppingItem(name: "Strawberries", image: UIImagePNGRepresentation(UIImage(named: "strawberries")!)!, isSelected: true )]
    
    func updateIsSelected(for item: ShoppingItem){
       
        guard let index = items.index(of: item) else {return}
        
        let temp = ShoppingItem(name: item.name, image: item.image, isSelected: item.isSelected)
        items.remove(at: index)
        items.insert(temp, at: index)
        
        }
    
}
