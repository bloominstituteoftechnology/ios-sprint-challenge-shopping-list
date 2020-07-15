import UIKit

struct PersistenceStorage {
  
  private var shopURL : URL? {
    let fm = FileManager.default
    guard let documentDirectory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    let shopURL = documentDirectory.appendingPathComponent("ShoppingList.plist")
    return shopURL
  }
  
   func saveToPersistStore<T: Codable>(for shop: T) {
    guard let fileURL = shopURL else { return }
    do {
      let encoder = PropertyListEncoder()
      let shoppingData = try encoder.encode(shop)
      try shoppingData.write(to: fileURL)
    } catch let err {
      print("Can't save photos.Error : \(err)")
    }
  }
  
   func loadFromPersistentStore<T: Codable>( shop:inout [T]) {
    guard let fileURL = shopURL else { return }
    do {
      let shopData = try Data(contentsOf: fileURL)
      let decoder = PropertyListDecoder()
      let decodedShop = try  decoder.decode([T].self, from: shopData)
      shop = decodedShop
    } catch let err {
      print("Can't load Data , error: \(err)")
    }
  }
}
