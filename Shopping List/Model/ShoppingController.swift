import UIKit

class ShoppingController: Codable {
    
    var shopping: [Shopping] = []

    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    var addedItems: [Shopping] {
        let add = shopping.filter({ $0.like == true })
        return add
    }
    
    var notAddedItems: [Shopping] {
        let notAdded = shopping.filter({ $0.like == false })
        return notAdded
    }
    
    func saveToPersitentStore() {
        guard let url = readingListURL else { return }
        let propertyListEncoder = PropertyListEncoder()
        do {
            let data = try propertyListEncoder.encode(shopping)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadToPersistentStore() {
        guard let url = readingListURL,
            FileManager.default.fileExists(atPath: url.path)   else { return }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            shopping = try decoder.decode([Shopping].self, from: data)
        } catch {
            print(error)
        }
    }
    
    var readingListURL: URL? {
        let fileManger = FileManager.default
        guard let documentsDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let finalLocation = documentsDirectory.appendingPathComponent("readingList.plist")
        return finalLocation
    }
}


}



















//     init() {
//        for i in 1...7 {
//            let imageString = ("Image\(i)")
//                guard let image = UIImage(named: imageString)
//                    else { return }
//            let shoppingImage = Shopping(image: image)
//                shopping.append(shoppingImage)
//            }

    

