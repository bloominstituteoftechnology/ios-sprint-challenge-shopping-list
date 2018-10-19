import Foundation
import UIKit

class ShoppingItemController {
    
    init() {
        let hasLaunched = UserDefaults.standard.bool(forKey: hasLaunchedKey)
        
        if !hasLaunched {
            
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for i in itemNames {
                create(with: i, image: UIImage(named: i) ?? UIImage())
            }
            UserDefaults.standard.set(true, forKey: hasLaunchedKey)
        } else { loadFromPersistentStore() }
    }
    
    func create(with name: String, image: UIImage) {
        guard let imageData = image.pngData() else { return }
        let item = ShoppingItem(name: name, imageData: imageData)
        items.append(item)
        saveToPersistentStore()
    }
    
    func update(item: ShoppingItem, isInShoppingList: Bool) {
        guard let index = items.index(of: item) else { return }
        let tempItem = ShoppingItem(name: item.name, imageData: item.imageData, isInShoppingList: isInShoppingList)
        items.remove(at: index)
        items.insert(tempItem, at: index)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            guard let itemsFileURL = itemsFileURL else { return }
            let plistEncoder = PropertyListEncoder()
            let itemsData = try plistEncoder.encode(items)
            try itemsData.write(to: itemsFileURL)
            
        } catch {
            NSLog("Error encoding shopping items: \(error)") }
    }
    func loadFromPersistentStore() {
        do {
            guard let itemsFileURL = itemsFileURL, FileManager.default.fileExists(atPath: itemsFileURL.path) else { return }
            let plistDecoder = PropertyListDecoder()
            let itemsData = try Data(contentsOf: itemsFileURL)
            self.items = try plistDecoder.decode([ShoppingItem].self, from: itemsData)
        } catch {
            NSLog("Error decoding shopping items: \(error)")
        }
    }
    
    var itemsFileURL: URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let fileName = "shopping-items.plist"
        return directory.appendingPathComponent(fileName)
    }
    
    var addedItems: [ShoppingItem] {
        return items.filter { $0.isInShoppingList }
    }
    
    var notAddedItems: [ShoppingItem] {
        return items.filter { !$0.isInShoppingList }
    }
    
    var hasLaunchedKey = "hasLaunchedKey"
    
    var items: [ShoppingItem] = []
    
}
