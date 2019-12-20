//
//  ShoppingListVC.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Class Properties
    var shopper = ShoppingController()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    //MARK: Helper Methods
    func setupViews() {
        
    }

}

extension ShoppingListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopper.shoppingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCell", for: indexPath) as? FoodItemCell else {fatalError("Cell not instantiated")}
        cell.item = shopper.shoppingItems[indexPath.item]
        print(cell.item?.name ?? "WARNING: Item Name Not Set")
        return cell
    }
    
    
}

extension ShoppingListVC: UICollectionViewDelegate {
    
}

