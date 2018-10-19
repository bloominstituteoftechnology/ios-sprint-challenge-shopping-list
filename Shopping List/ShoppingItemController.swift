import UIKit

class ShoppingItemController {
    
    private(set) var shoppingItems: [ShoppingItem] = []
  
    private var shoppingListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "shoppinglist.plist"
        return documentDirectory?.appendingPathComponent(fileName)
    }

    init() {
        loadFromPersistentStore()
        if self.shoppingItems.isEmpty {
            self.shoppingItems  = [
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "apple")!)!, item: "apple", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "grapes")!)!, item: "grapes", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "milk")!)!, item: "milk", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "muffin")!)!, item: "muffin", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "popcorn")!)!, item: "popcorn", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "soda")!)!, item: "soda", addedToList: false),
                ShoppingItem(imageData: UIImagePNGRepresentation(UIImage(named: "strawberries")!)!, item: "strawberries", addedToList: false)
            ]
        }
    }
    
    func create(item: String, addedToList: Bool, imageData: Data) {
        let shoppingItem = ShoppingItem(imageData: imageData, item: item, addedToList: addedToList)
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
