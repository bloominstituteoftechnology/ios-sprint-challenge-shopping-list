import Foundation

protocol ShoppingTableViewCellDelegate: class {
    func toggleAdd(for cell: ShoppingCollectionViewCell)
}
