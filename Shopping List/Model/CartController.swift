//
//  CartController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

extension String {
    static let listInitializedKey = "listInitialized"
}

class CartController {
    var cart = [ShoppingItem]()
    
    var numOfItemsInCart: Int {
        return cart.filter { $0.onShoppingList == true }.count
    }
    
    var listInitialized: Bool {
        get {
            UserDefaults.standard.bool(forKey: .listInitializedKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: .listInitializedKey)
        }
    }
    
    // Cart delivery information.
    var name = ""
    var address = ""
    
    // This initilizer is treated as the viewDidLoad of the model controller.
    init() {
        if listInitialized == false {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

            for item in itemNames {
                let item = createItem(title: item, image: item)
                cart.append(item)
            }
            
            saveToPersistentStore()

            listInitialized = true
        } else {
            loadFromPersistentStore()
        }
    }

    func createItem(title: String, image: String ) -> ShoppingItem {
        let item = ShoppingItem(itemName: title,
                                onShoppingList: false,
                                imageName: image)
        return item
    }

    // MARK: Persistent Store
    
    var cartURL: URL? {
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let cartURL = documentsDir?.appendingPathComponent("cart.plist")
        
        return cartURL
    }
    
    func saveToPersistentStore() {
        // Convert our shopping cart Property List
        let encoder = PropertyListEncoder()
        
        do {
            let cartData = try encoder.encode(cart)
            
            guard let cartURL = cartURL else { return }
            
            try cartData.write(to: cartURL)
            
        } catch {
            print("Unable to save shopping cart to plist: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        do {
            guard let cartURL = cartURL else { return }
            
            let cartData = try Data(contentsOf: cartURL)
            
            let decoder = PropertyListDecoder()
            
            let decodedCart = try decoder.decode([ShoppingItem].self, from: cartData)
            
            self.cart = decodedCart
        } catch {
            print("Unable to open shopping cart plist: \(error)")
        }
    }
}
