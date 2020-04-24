//
//  ShoppingListModel.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

var itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

struct ShoppingItem: Codable, Equatable {
    
    
    var name: String
    var isAdded: Bool
    
        var image: UIImage? {
            
         for i in itemNames {
            
             if i == name {
                
                 return UIImage(named: i)
                
             }
         }

         //Return Default
         return UIImage(named: itemNames[0])
     }
    
    
    
}
