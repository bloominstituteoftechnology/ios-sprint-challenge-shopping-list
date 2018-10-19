import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
  
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
