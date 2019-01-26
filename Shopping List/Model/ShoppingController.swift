import UIKit

class ShoppingController {
    
     var shopping: [Shopping] = []
    
    
    let foodNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]

    func createShopping() {
        for name in foodNames {
            let item = Shopping(name: name, foodName: name)
            shopping.append(item)
            //saveToPErs
        }
    }
    
    
    init() {
        createShopping()
    }
    
    
//    init() {
//        loadImages()
//    }
//
//    func loadImages() {
//        for i in 1 ... 7 {
//           var string = "image\(i)"
//
//            var anotherString: String
//
//            guard let image = UIImage(named: string) else { return }
//
////            if string == "image1" {
////                var x = i
////                x = "Apple"
//////                var x: String
//////                x = "Apple"
////            }
//
//            let food = Shopping(image: image, foodName: string)
//
////            if food.foodName == "image1" {
////                shopping.append(image: image, foodName: anotherString)
////            }
//            shopping.append(food)
//            print("images loaded")
//        }
//    }
    
        func toggleIsLiked(for painting: Shopping) {
            //Make sure you can get an index for the painting, then toggle the isLiked property
            guard let index = shopping.index(of: painting) else { return }
            shopping[index].addOrNot = !shopping[index].addOrNot
        
        
        
    }
    
//    func saveToPersitentStore() {
//        guard let url = readingListURL else { return }
//        let propertyListEncoder = PropertyListEncoder()
//        do {
//            let data = try propertyListEncoder.encode(shopping)
//            try data.write(to: url)
//        } catch {
//            print(error)
//        }
//    }
//
//    func loadToPersistentStore() {
//        guard let url = readingListURL,
//            FileManager.default.fileExists(atPath: url.path)   else { return }
//        do {
//            let decoder = PropertyListDecoder()
//            let data = try Data(contentsOf: url)
//            shopping = try decoder.decode([Shopping].self, from: data)
//        } catch {
//            print(error)
//        }
//    }
//
//    var readingListURL: URL? {
//        let fileManger = FileManager.default
//        guard let documentsDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else {
//            return nil
//        }
//
//        let finalLocation = documentsDirectory.appendingPathComponent("shoppingList.plist")
//        return finalLocation
//    }
    
    
}
