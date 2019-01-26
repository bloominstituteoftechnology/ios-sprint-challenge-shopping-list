//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ItemCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    let shoppingItemController = ShoppingItemController()
    var shoppingItems: [ShoppingItem] {
        
        
        return shoppingItemController.shoppingList
    }

    @IBAction func nextButton(_ sender: Any) {
    }


    override func viewDidLoad() {
        super.viewDidLoad()



        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShopperSegue" {
            guard let destinationVC = segue.destination as? ItemsPickedViewController else { return }
            destinationVC.shoppingListController = shoppingItemController
            
        }
        
    }



    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shoppingItemController.shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShoppingItemCollectionViewCell
        let item = shoppingItems[indexPath.item]

        cell.imageView.image = UIImage(named: item.name)
        cell.itemLabel.text = item.name


        // Configure the cell
    
        return cell
    }



}
