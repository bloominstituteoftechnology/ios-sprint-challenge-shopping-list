import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    let targetDimension: CGFloat = 320
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView?.collectionViewLayout as?
            UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                reuseIdentifier, for: indexPath) as? CollectionViewCell else {
                fatalError("Inconsistent view state")
            }
            
            cell.imageView.image = image[indexPath.row]
            return cell
        }
    }
}
