//
//  ShoppingItemCollectionViewController.swift
//  ios-sprint-challenge-shopping-list
//
//  Created by Nicolas Rios on 10/13/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//
import UIKit

private let reuseIdentifier = "ShoppingCell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    
    var shoppingListController = ShoppingListController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

  

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

             if segue.identifier == "PlaceOrderShowSegue" {
                guard let placeOrderVC = segue.destination as? SubmitOrderViewController else { return }

                 for item in shoppingListController.shoppingList {
                    if item.isAdded == true {
                        placeOrderVC.basket.append(item)
                    }
                }
            }
        }

         // MARK: UICollectionViewDataSource
        
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if section == 0 {
                return shoppingListController.inCart.count
            } else if section == 1 {
                return shoppingListController.notInCart.count
            } else {
                return shoppingListController.shoppingList.count
            }
        }

         override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }

             if indexPath.section == 0 {
                cell.shoppingItem = shoppingListController.inCart[indexPath.item]
            } else {
                cell.shoppingItem = shoppingListController.notInCart[indexPath.item]
            }
            return cell
        }

         override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
        }


    
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
            let selectedItem: ShoppingItem = {
                if indexPath.section == 0 {
                    return shoppingListController.inCart[indexPath.item]
                } else {
                    return shoppingListController.notInCart[indexPath.item]
                }
            }()
            shoppingListController.shoppingItemToggle(for: selectedItem)
            collectionView.reloadData()
            return false
        }
    }
