//
//  DeliveryController.swift
//  Shopping List
//
//  Created by Jonathan T. Miles on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class DeliveryController {
    
    init(){
        loadFromPersistentStore()
    }
    
    func savecurrentDeliveryAddress(name: String, addressLineOne: String, addressLineTwo: String?, city: String, state: String, zipCode: String) {
        let deliveryAddress = DeliveryAddress(name: name, addressLineOne: addressLineOne, addressLineTwo: addressLineTwo, city: city, state: state, zipCode: zipCode)
        deliveries = [deliveryAddress]
        
        saveToPersistentStore()
    }
    
    var deliveries = [DeliveryAddress]()
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(deliveries)
            try data.write(to: url)
        } catch {
            NSLog("The delivery address was not stored: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            deliveries = try decoder.decode([DeliveryAddress].self, from: data)
        } catch {
            NSLog("Error retrieving delivery address from persistent store: \(error)")
        }
    }
    
    var persistentFileURL: URL? {
        let fm = FileManager.default
        guard let docsDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return docsDir.appendingPathComponent("deliveryData.plist")
    }
    
}
