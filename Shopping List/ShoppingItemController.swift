import UIKit

class ShoppingItemController {
    
    private(set) var shoppingItems: [ShoppingItem] = []
  
    init() {
        if UserDefaults.standard.bool(forKey: "ShoppingKey") {
            loadFromPersistentStore()
        } else {
            UserDefaults.standard.set(true, forKey: "ShoppingKey")
            self.create(image: "apple", item: "Apple")
            self.create(image: "grapes", item: "Grapes")
            self.create(image: "milk", item: "Milk")
            self.create(image: "muffin", item: "Muffin")
            self.create(image: "popcorn", item: "Popcorn")
            self.create(image: "soda", item: "Soda")
            self.create(image: "strawberries", item: "Strawberries")
        }
    }
    
    func create(image: String, item: String) {
        let shoppingItem = ShoppingItem(image: image, item: item)
        shoppingItems.append(shoppingItem)
        saveToPersistentStore()
    }
    
    func toggleIsAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        shoppingItems[index].addedToList = !shoppingItems[index].addedToList
        saveToPersistentStore()
    }
    
    func totalInCart() -> Int {
        var count: Int = 0
        for item in shoppingItems {
            if item.addedToList == true {
                count += 1
            }
        }
        return count
    }
    
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppinglist.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    // Persistence Functions
    private func saveToPersistentStore() {
        let plistEncoder = PropertyListEncoder()
        
        do {
            let shoppingListData = try plistEncoder.encode(shoppingItems)
            guard let shoppingListURL = shoppingListURL else { return }
            try shoppingListData.write(to: shoppingListURL)
        } catch {
            NSLog("Error encoding shoppping list: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        do {
            guard let shoppingListURL = shoppingListURL,
                FileManager.default.fileExists(atPath: shoppingListURL.path) else { return }
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            let plistDecoder = PropertyListDecoder()
            self.shoppingItems = try plistDecoder.decode([ShoppingItem].self, from: shoppingListData)
        } catch {
            NSLog("Error decoding shopping list: \(error)")
        }
    }
    
    
}
