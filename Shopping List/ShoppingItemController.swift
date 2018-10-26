import Foundation

class ShoppingItemController {
    
    let shoppingItems = [
    ShoppingItem (name: "Apple", imageName: "apple"),
    ShoppingItem (name: "Grapes", imageName: "grapes"),
    ShoppingItem (name: "Milk", imageName: "milk"),
    ShoppingItem (name: "Muffin", imageName: "muffin"),
    ShoppingItem (name: "Popcorn", imageName: "popcorn"),
    ShoppingItem (name: "Soda", imageName: "soda"),
    ShoppingItem (name: "Strawberries", imageName: "strawberries"),
    ]
    
    var shoppingItems: [ShoppingItem] = []
    
    init() {
        loadFromPersistence()
    }
    
    func createShoppingItem(name: String, image: UIImage, isAdded: Bool){
        let shoppingItem = ShoppingItem(name: name, image: image, isAdded: false)
        shoppingItems.append(shoppingItem)
        
        saveToPersistence()
    }
    
    func updateShoppingItem(shoppingItem: ShoppingItem, withName name:String, image: UIImage){
        shoppingItem.name = name
        shoppingItem.image = UIImage
        shoppingItem.isAdded = true
        
        saveToPersistence()
        
    }
    func deleteShoppingItem(index: Int){
        shoppingItems.isAdded = false
        
        saveToPersistence()
    }
    private func loadFromPersistence() {
        do {
            let shoppingItemsData = try Data(contentsOf: shoppingItemsFileURL)
            let decoder = JSONDecoder()
            let decodedShoppingItems = try decoder.decode([ShoppingItem].self, from: shoppingItemsData)
            
            shoppingItems = decodedShoppingItems
        } catch {
            NSLog("Error decoding shoppingItems: \(error)")
        }
    }
    
    //save persistence
    private func saveToPersistence() {
        let encoder = JSONEncoder()
        
        do {
            let shoppingItemsData = try encoder.encode(shoppingItems)
            try shoppingItems.write(to: shoppingItemsFileURL)
        } catch {
            NSLog("Error encoding shoppingItems: \(error)")
        }
    }
    var memoriesFileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("shoppingItems.json")
    
}
