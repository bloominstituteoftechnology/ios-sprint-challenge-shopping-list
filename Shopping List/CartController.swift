//
//  CartController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class CartController {
    var cart = [ShoppingItem]()
    
    // This initilizer is treated as the viewDidLoad of the model controller.
    init() {
        loadFromPersistentStore()
    }

    // FIXME: Reuse?
//    func create(pic: Photo) {
//        photos.append(pic)
//
//        saveToPersistentStore()
//    }

    // FIXME: Reuse?
//    func create(title: String, image: Data ) {
//        let pic = Photo(imageData: image, title: title)
//
//        photos.append(pic)
//
//        saveToPersistentStore()
//    }
    
    // FIXME: Reuse?
//    func update(pic: Photo, title: String, image: Data) {
//        var somethingChanged = false
//
//        if let index = photos.firstIndex(where: { $0 == pic }) {
//            if (photos[index].title != title) {
//                photos[index].title = title
//                somethingChanged = true
//            }
//            if (photos[index].imageData != image) {
//                photos[index].imageData = image
//                somethingChanged = true
//            }
//        }
//
//        if somethingChanged {
//            saveToPersistentStore()
//        }
//    }

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
