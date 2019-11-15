import Foundation

 
class ShoppingItemCotroller {
   var shoppingItems: [ShoppingItem] = []
   private var shoppingListURL: URL? {
    
        let fileManager = FileManager.default
    
              guard let documentsDir = fileManager.urls(for: .documentDirectory, in:
                .userDomainMask).first else { return nil }
    
              return documentsDir.appendingPathComponent("ShoppingList.plist")
   }
   func saveToPersistentStore() {
    
       let encoder = PropertyListEncoder()
       do {
        
           let shoppingItemsData = try encoder.encode(shoppingItems)
        
           guard let fileURL = shoppingListURL else { return }
        
           try shoppingItemsData.write(to: fileURL)
        
       } catch  {
        
           print("Error saving shoppings list: \(error)")
       }
   }
   func loadFromPersistentStore() {
    
       do {
        
           guard let fileURL = shoppingListURL
            
                  else { return }
        
           let shoppingItemsData = try Data(contentsOf: fileURL)
        
           let decoder = PropertyListDecoder()
        
           let  decodedShoppingItems = try decoder.decode([ShoppingItem].self, from:
            shoppingItemsData)
        
           shoppingItems = decodedShoppingItems
        
       } catch {
        
           print("Error loading shoppings list data: \(error)")
       }
   }
}
