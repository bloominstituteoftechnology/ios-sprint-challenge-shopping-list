import UIKit

class ShoppingItemController {
    
    init() {
        let hasLaunched = UserDefaults.standard.bool(forKey: hasLaunchedKey)
        if hasLaunched {
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for i in itemNames {
                create(with: i, image: UIImage(named: i) ?? UIImage())
            }
            UserDefaults.standard.set(true, forKey: hasLaunchedKey)
        } else { readFromFile() }
    }
    var hasLaunchedKey = "hasLaunchedKey"
    var items: [ShoppingItem] = []
    var addeditems: [ShoppingItem] {
        return items.filter { $0.isInShoppingList }
    }
    
    var notAddedItems: [ShoppingItem] {
        return items.filter { $0.isInShoppingList }
    }
    //Create Item
    func create(with name: String, image: UIImage) {
        guard let imageData = image.pngData() else { return }  //png....
        let item = ShoppingItem(name: name, imageData: imageData)
        items.append(item)
        writeToFile()
    }
    
    //Update item
    func update(item: ShoppingItem, isInShoppingList: Bool) {
        guard let index = items.index(of: item) else { return }
        let tempItem = ShoppingItem(name: item.name, imageData: item.imageData, isInShoppingList: isInShoppingList)
        items.remove(at: index)
        items.insert(tempItem, at: index)
        writeToFile()
    }
    
    //PERSISTENCE url
    var itemsFileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("shoppinglist.json")
    
    //write to shoppinglist.json
    func writeToFile() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: itemsFileURL)
        } catch {
            print("Error while saving shopping items: \(error)")
            return
        }
    }
    
    //read from shoppinglist.json
    func readFromFile() {
        do {
            let data = try Data(contentsOf: itemsFileURL)
            let records = try JSONDecoder().decode([ShoppingItem].self, from: data)
            items.append(contentsOf: records)
        } catch {
            print("Error while reading shopping items: \(error)")
            return
        }
    }
}

