import UIKit

class ShoppingItemController {
    
    init() {
        saveToPersistence()
        
    }
    
    //MARK: - CRUD
    
    func create(name: String, inShoppingList: Bool, imageData: Data) {
        let shoppingItem = ShoppingItem(name: name, inShoppingList: inShoppingList, imageData: imageData)
        shoppingItems.append(shoppingItem)
    }
    
    func update(shoppingItem: ShoppingItem, withTitle title: String, inShoppingList: Bool, imageData: Data) {
        
        shoppingItem.inShoppingList = inShoppingList
        shoppingItem.imageData = imageData
        
        saveToPersistence()
    }
    
    func deleteItemAt(index: Int) {
        shoppingItems.remove(at: index)
        
        saveToPersistence()
    }
    
    //Mark: - Private Functions
    
    private func loadFromPersistence() {
        do {
            let shoppingItemData = try Data(contentsOf: shoppingItemFileURL)
            let decoder = JSONDecoder()
            let decodedShoppingItem = try decoder.decode([ShoppingItem].self, from: shoppingItemData)
            
            shoppingItems = decodedShoppingItem
        } catch {
            NSLog("Error decoding Shopping Items")
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


var shoppingItems: [ShoppingItem] = []
var launchedKey = "launchedKey"
let items = ["apple", "grapes", "milk", "popcorn", "soda", "strawberries"]


}
