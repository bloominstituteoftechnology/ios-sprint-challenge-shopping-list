import UIKit

class ShoppingController {
    
     var shopping: [Shopping] = []
    
    init() {
        loadImages()
    }
    
    func loadImages() {
        for i in 1 ... 7 {
            let string = "Image\(i)"
            guard let image = UIImage(named: string) else { return }
            let shopping = Shopping(image: image, foodName: "food\(i)")
            shopping.append(shopping)
        }
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
        
        let finalLocation = documentsDirectory.appendingPathComponent("shoppingList.plist")
        return finalLocation
    }
    
    
}
