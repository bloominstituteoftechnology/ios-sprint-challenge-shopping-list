import Foundation

class ShoppingListController {
    
    
    
    // MARK: - Properties
    
    // Shopping items -> Needed to be initialized (once)
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var firstInitalizationOccured: Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "ShouldInitialize")
    }
    
    // Shopping Items [Array]
    var shoppingItems: [ShoppingItem] = []
    
   
    
    // MARK: - Initalization
    
    // Initializing the array of Shopping Items (once)
    init() {
        if !firstInitalizationOccured {
            for x in itemNames {
                createShoppingItem(itemName: x, hasBeenAdded: false)
            }
            saveToPersistentStore()
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "ShouldInitialize")
        }
        loadFromPersistentStore()
    }
    
    
    
    // MARK: - Functions
    
    // Func Initializing Shopping Items -> Add to Aray
    @discardableResult func createShoppingItem(itemName: String, hasBeenAdded: Bool) -> ShoppingItem {
        let shoppingItem = ShoppingItem(itemName: itemName, hasBeenAdded: hasBeenAdded)
        shoppingItems.append(shoppingItem)
        return shoppingItem
    }
    
    
    
    // MARK: - Persistent Storage
    
    // Creating URL
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("ShoppingItems.plist")
    }
    
    // Saving to URL
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(shoppingItems)
            try data.write(to: url)
        } catch {
            print("Error saving Shopping Items data: \(error)")
        }
    }
    
    // Loading from URL defined above if it exists
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
        } catch {
            print("Error loading Shopping Items data: \(error)")
        }
    }
}

