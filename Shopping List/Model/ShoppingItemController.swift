import UIKit

class ShoppingItemController {
    
    init() {
        loadFromPersistence()
        shoppingItems.append(ShoppingItem(name: "apple", inShoppingList: false, imageName: "apple"))
        shoppingItems.append(ShoppingItem(name: "grapes", inShoppingList: false, imageName: "grapes"))
        shoppingItems.append(ShoppingItem(name: "milk", inShoppingList: false, imageName: "milk"))
        shoppingItems.append(ShoppingItem(name: "muffin", inShoppingList: false, imageName: "muffin"))
        shoppingItems.append(ShoppingItem(name: "popcorn", inShoppingList: false, imageName: "popcorn"))
        shoppingItems.append(ShoppingItem(name: "soda", inShoppingList: false, imageName: "soda"))
        shoppingItems.append(ShoppingItem(name: "strawberries", inShoppingList: false, imageName: "strawberries"))
        
    }
    
    //MARK: - CRUD
    
    func create(name: String, inShoppingList: Bool, imageName: String) {
        let shoppingItem = ShoppingItem(name: name, inShoppingList: inShoppingList, imageName: imageName)
        shoppingItems.append(shoppingItem)
    }
    
    var url: URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else {return nil}
        let filName = "shoppingItems.json"
        return directory.appendingPathComponent(filName)
    }
    func update(shoppingItem: ShoppingItem, withTitle title: String, inShoppingList: Bool, imageName: String) {
        
        shoppingItem.inShoppingList = inShoppingList
        shoppingItem.imageName = imageName
        
        saveToPersistence()
    }
    
    func deleteItemAt(index: Int) {
        shoppingItems.remove(at: index)
        
        saveToPersistence()
    }
    
    //Mark: - Private Functions
    
    func loadFromPersistence() {
        do {
            guard let url = url, FileManager.default.fileExists(atPath: url.path) else {return}
            let shoppingItemData = try Data(contentsOf: shoppingItemFileURL)
            let decoder = JSONDecoder()
            let decodedShoppingItem = try decoder.decode([ShoppingItem].self, from: shoppingItemData)
            
            shoppingItems = decodedShoppingItem
        } catch {
            NSLog("Error decoding Shopping Items: \(error)")
        }
    }
    
    private func saveToPersistence() {
        let encoder = JSONEncoder()
        do {
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItemsData.write(to: shoppingItemFileURL)
        } catch {
            NSLog("Error encoding shopping item")
        }
    }
    
    var shoppingItemFileURL = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Documents")
    .appendingPathComponent("shoppingItem.json")


    var shoppingItems: [ShoppingItem] = [ShoppingItem]()
    var launchedKey = "launchedKey"



}
