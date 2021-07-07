//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_201 on 10/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
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
                guard let placeOrderVC = segue.destination as? PlaceOrderViewController else { return }

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
                return shoppingListController.inBasket.count
            } else if section == 1 {
                return shoppingListController.notInBasket.count
            } else {
                return shoppingListController.shoppingList.count
            }
        }

         override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemCollectionViewCell else { return UICollectionViewCell() }

             if indexPath.section == 0 {
                cell.shoppingItem = shoppingListController.inBasket[indexPath.item]
            } else {
                cell.shoppingItem = shoppingListController.notInBasket[indexPath.item]
            }
            return cell
        }

         override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
        }


    
         override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
            let selectedItem: ShoppingItem = {
                if indexPath.section == 0 {
                    return shoppingListController.inBasket[indexPath.item]
                } else {
                    return shoppingListController.notInBasket[indexPath.item]
                }
            }()
            shoppingListController.shoppingItemToggle(for: selectedItem)
            collectionView.reloadData()
            return false
        }
    }

//         override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//            guard let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ShoppingCell", for: indexPath) as? ShoppingItemsCollectionReusableView else { return UICollectionReusableView() }
//
//             if indexPath.section == 0 {
//                sectionTitle.sectionTitleLabel.text = "Basket: \(shoppingListController.inBasket.count) items."
//            } else if indexPath.section == 1{
//                sectionTitle.sectionTitleLabel.text = "Available Items"
//            }
//
//             return sectionTitle
//        }
