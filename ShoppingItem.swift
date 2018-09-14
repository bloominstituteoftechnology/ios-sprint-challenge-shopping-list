//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Madison Waters on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

struct ShoppingItem: Equatable { //, Codable - Add When ready
    
    init(itemImage: String, itemName: String, wasAdded: Bool  = false) {
        self.image = UIImage(named: itemImage)!
        self.itemName = itemName
        self.wasAdded = wasAdded
    }
    
    var image: UIImage
    var itemName: String
    var wasAdded: Bool
    
    
}

//A ShoppingItem model object with properties for an image, name of the item, and Bool indicating whether the item has been added to the shopping list.

//    On the first launch of the application, use the given shopping item names and images to create instances of the ShoppingItem model, and save them to a file. These shopping items should be persisted between launches of the application. Use UserDefaults to make sure that new shopping items are initialized only once.

//    This snippet has the names of the images in the assets folder. Use it to create the instances of ShoppingList: - let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

//Upon selecting the custom cell, the item's Bool value should change from true to false or vice-versa.

//A bar button item on the collection view controller that performs a "Show" segue to a detail UIViewController. This UIViewController should allow the user to fill in their name and address. It should also display how many items have been added to "shopping list".

//In the same view controller, add a button that schedules a local notification saying that the user's delivery will be to their address in 15 minutes. The notification's content must contain their name and address.
