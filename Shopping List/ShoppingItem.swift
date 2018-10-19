import UIKit

struct ShoppingItem: Equatable, Codable {
    var imageData: Data
    var item: String
    var addedToList: Bool
}
