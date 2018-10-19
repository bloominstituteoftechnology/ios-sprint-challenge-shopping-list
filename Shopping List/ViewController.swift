//import UIKit
//
//class ShoppingItem: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//   @IBOutlet weak var name: UITextField!
// save name code save with JSON

//@IBOutlet weak var address: UITextField!
// save address code save with JSON
//@IBAction func send(_ sender: Any)

// -- send order code save with JSON
//case countDownTimer = 900
// for 15 min timer
//}


//
//    let reuseIdentifier = "cell"
//    var images: [UIImage] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
//        collectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
//
//        for i in 1...12 {
//            guard let image = UIImage(named: "Image\(i)") else { return }
//            images.append(image)
//        }
//        collectionView?.allowsMultipleSelection = true
//    }
//
//    let targetDimension: CGFloat = 320
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        guard let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("unable to retrieve layout")}
//
//        let insetAmount: CGFloat = 32
//        layout.minimumLineSpacing = .greatestFiniteMagnitude
//        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("No Cell")}
//
////        cell.imageView.image = images[indexPath.row]
//        return nib
////    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)  -> CGSize {
//        let image = images[indexPath.row]
//        let maxDimension = max(image.size.width, image.size.height)
//        let scale = targetDimension / maxDimension
//        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
//    }
//
////    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
////        cell.layer.borderWidth = 1
////        cell.layer.borderColor = UIColor.green.cgColor
////    }
////    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
////        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
////        cell.layer.borderWidth = 1
////        cell.layer.borderColor = UIColor.black.cgColor
//    }
//}
//
