//
//  ShoppingListCollectionVC.swift
//  Shopping List
//
//  Created by Nick Nguyen on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
  
  //MARK:- Outlets
  
  @IBOutlet private weak var nextButton: UIBarButtonItem!
  
  //MARK:- Properties
  private let shopController = ShopplingListController()

  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    nextButton.isEnabled = shopController.addedItems.count > 0
    collectionView.reloadData()
  }
  
 // MARK:- UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return section == 0 ? shopController.addedItems.count : shopController.notAddedItems.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Helper.shopCellId, for: indexPath) as! ShopCell
    let item = getItemAt(indexPath: indexPath)
    cell.shoppingItem = item
    return cell
    
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
      sectionHeader.sectionHeaderLabel.text = indexPath.section == 0 ? "Cart: \(shopController.addedItems.count)" : "Shopping Store: \(shopController.notAddedItems.count)"
      return sectionHeader
    }
    return UICollectionReusableView()
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
    let item = getItemAt(indexPath: indexPath)
    shopController.toggleHasBeenAdded(for: item)
    nextButton.isEnabled = shopController.addedItems.count > 0
    collectionView.reloadData()

  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Helper.nextSeque {
      let destinationController = segue.destination as! DetailViewController
      destinationController.shopController = self.shopController
    }
  }
  
  private func getItemAt(indexPath: IndexPath) -> ShoppingItem {
    let shoppingItem: ShoppingItem
    switch indexPath.section {
      case 0:
        shoppingItem = shopController.addedItems[indexPath.item]
      default:
        shoppingItem = shopController.notAddedItems[indexPath.item]
    }
    return shoppingItem
  }
}

extension ShoppingListCollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxWidth: CGFloat = 200
    let availableWidth = collectionView.frame.width
    
    var numColumns: CGFloat {
      if availableWidth < maxWidth * 3 {
        return 2
      } else {
        return (availableWidth / maxWidth).rounded(.down)
      }
    }
    let cellWidth = (availableWidth / numColumns) - 16
    let cellHeight = cellWidth * 1.15
    return CGSize(width: cellWidth, height: cellHeight)
  }
}
