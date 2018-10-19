import UIKit

class CollectionViewController: UICollectionViewController {
    
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ShoppingItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        // IMPORTANT
        collectionView.allowsMultipleSelection = true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    //IMPORTANT
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else {
//            fatalError("Inconsistent view state")
//        }
//
//        cell.shoppingItemName.text = // object item name here
//        cell.shoppingItemImage.backgroundColor = // object item image here
//
//      //  return cell
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        let amount: CGFloat = 32
        
        layout.sectionInset = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
    }
    
    
    // IMPORTANT
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell at indexPath \(indexPath) was selected")
    }
    
    
    // IMPORTANT
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Cell at indexPath \(indexPath) was deselcted")
    }
    
}
