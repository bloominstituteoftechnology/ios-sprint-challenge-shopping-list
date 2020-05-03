//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Sammy Alvarado on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListItems {
    var items: [ShoppingItem] {

        let items = [
            ShoppingItem(imageName: "Apple", itemName: "Apple"),
            ShoppingItem(imageName: "Grapes", itemName: "Grapes"),
            ShoppingItem(imageName: "Milk", itemName: "Milk"),
            ShoppingItem(imageName: "Muffin", itemName: "Muffin"),
            ShoppingItem(imageName: "Popcorn", itemName: "Popcorn"),
            ShoppingItem(imageName: "Soda", itemName: "Soda"),
            ShoppingItem(imageName: "Strawberries", itemName: "Strawberries"),
        ]
        
//        var item: ShoppingItem? {
//            didSet {
//                updateViews()
//            }
//        }
//        
//        private func updateViews() {
//            guard let item = self.items else { return }
//            
//            // This allows me to which off and on the button.
//            let addItemTitle = item.didSelectItemAt ? "Added" : "Not Added"
//            didAddButtonLabel.setTitle(addItemTitle, for: [])
//        
//        }
        
        
        return items
    }
}
