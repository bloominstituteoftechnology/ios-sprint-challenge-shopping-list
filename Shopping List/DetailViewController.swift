//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Zack Larsen on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var ItemsInShoppingList: UILabel!
    @IBOutlet weak var NameLabel: UITextField!
    @IBOutlet weak var AddressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SendOrderButton(_ sender: Any) {
//        guard let name = NameLabel.text, address = AddressLabel.text
//            else { return }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Submit Order:", message: "\(String(describing: NameLabel))\(AddressLabel ?? <#default value#>)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)

}
}
