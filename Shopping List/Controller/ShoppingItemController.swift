//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    private(set) var items: [ShoppingItem] = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("shoppingItems.plist")
    }
    
    init() {
        // load from p store
    }
}
