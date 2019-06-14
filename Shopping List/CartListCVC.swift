import Foundation
import UIKit

// As a note, this whole selection thing doesn't work properly
// It seems to be a combination of problems with CollectionViewController
// and how swift handles references (this would be a lot easier in Objective-C)
// so .... it works well enough.

class CartListCVC: UICollectionViewController, CartCellDelegate
{
	var controller = CartController()

	func updateItem(_ item: CartItem, _ new:Bool)
	{
		guard let index = controller.items.index(of:item) else {return}
		controller.items[index] = item
		controller.items[index].requested = new
	}

	override func viewWillAppear(_ animated: Bool)
	{
		collectionView?.allowsMultipleSelection = true
		collectionView?.reloadData()
	}

	override func numberOfSections(in collectionView: UICollectionView) -> Int
	{
		return 1
	}
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		return controller.items.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
	{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
		cell.delegate = self
		print("Reloading..")
		cell.item = controller.items[indexPath.item]
		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? RequestOrderVC {
			dest.controller = controller
		}
	}

	override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
	{
		return true
	}
	override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
	{
		print("Should Deselect?")
		collectionView.deselectItem(at: indexPath, animated: false)
		controller.items[indexPath.item].requested = false
		return false
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
	{
		print("Selected")
		controller.items[indexPath.item].requested = true
		//collectionView.reloadSections([0])
	}
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
	{
		print("Deselected")
		controller.items[indexPath.item].requested = false
		//collectionView.reloadSections([0])
	}
}

