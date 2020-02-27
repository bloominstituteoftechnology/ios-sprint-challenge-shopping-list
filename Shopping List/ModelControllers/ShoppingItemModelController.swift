
import Foundation

class ShoppingItemModelController {
    
    var shoppingList: [ShoppingItem] = []
    
    // Loads from UserDefaults or else creates a new list.
    init() {
        if UserDefaults.standard.bool(forKey: .alreadyExistsKey) {
            loadFromPersistentStore()
        } else {
            let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
            for item in itemNames {
                shoppingList.append(ShoppingItem(itemName: item))
            }
            saveToPersistentStore()
            UserDefaults.standard.set(true, forKey: .alreadyExistsKey)
        }
    }
    
    // MARK: - Methods
    
    // Toggling the wasAdded vs. !wasAdded. Called in ...
    func toggleItemAdded(item: ShoppingItem) {
        guard let index = shoppingList.firstIndex(of: item) else { return }
        shoppingList[index].wasAdded.toggle()
        saveToPersistentStore() //Do I need this? Is it appropriate here?
    }
    
    // Arrays of added items vs. not added items
    var addedItems: [ShoppingItem] {
        return shoppingList.filter { $0.wasAdded }
    }
    var notAddedItems: [ShoppingItem] {
        return shoppingList.filter { $0.wasAdded == false }
    }
    
    
    // MARK: - Persistence
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("shopping.plist")
    }
    
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let shoppingData = try encoder.encode(shoppingList)
            try shoppingData.write(to: url)
        } catch {
            print("Error saving shopping data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let shoppingData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingList = try decoder.decode([ShoppingItem].self, from: shoppingData)
        } catch {
            print("Error loading shopping data: \(error)")
        }
    }
}
