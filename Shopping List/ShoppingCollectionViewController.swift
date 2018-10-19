//
//  CollectionCollectionViewController.swift
//  Shopping List
//
//  Created by Yvette Zhukovsky on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCollectionViewController: UICollectionViewController {
    
var shoppingController = ShoppingController()
    




        let reuseIdentifier = "cell"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
            collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
            
            collectionView!.allowsMultipleSelection = true
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            guard let layout = collectionView!.collectionViewLayout as? UICollectionViewFlowLayout else {
                fatalError("Unable to retrieve layout")
            }
            
            layout.itemSize = CGSize(width: 80, height: 80)
        }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell
            else { fatalError("error") }
        
        cell.selectedBackgroundView = UIView()
        
        
        return cell
    }
    
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }

    
    
    
        
        //  override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //    return 1
        //  }
        
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 7
        }
    
    
    
    

    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingController.shoppingItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            guard let destVC = segue.destination as? ViewController else { return }
            destVC.showViewController = ShoppingController
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    //    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    //
    //        cell.image = shoppingController.shoppingItems[indexPath.item].image
    //        cell.itemName.text = shoppingController.shoppingItems[indexPath.item].name
    //        if shoppingController.shoppingItems[indexPath.item].addedToList == false {
    //            cell.AddItem.text = ""
    //        } else {
    //            cell.AddItem.text = "added"
    //        }
    //
    //        return cell
    //    }
    //
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let image = UIImage(data: shoppingController.shoppingItems[indexPath.item].image)
        cell.showimage.image = image
        cell.itemName.text = shoppingController.shoppingItems[indexPath.item].name
        if shoppingController.shoppingItems[indexPath.item].added == false {
            cell.itemName.text = ""
            
        }
        // MARK: UICollectionViewDelegate
        
        /*
         // Uncomment this method to specify if the specified item should be highlighted during tracking
         override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment this method to specify if the specified item should be selected
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
         return true
         }
         */
        
        /*
         // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
         override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
         return false
         }
         
         override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
         
         }
         */
        
        
        
}
}
