// ShoppingListController.swift
//  Lotanna iOS3 Sprint 2 Challenge begins!

import UIKit

class ShoppingListController: UICollectionViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering the cell class
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "groceryCell")
        
    }

    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let selectionsGroup = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "selectedArea", for: indexPath) as? SelectionArea {
            if indexPath.section == 0 {
                selectionsGroup.selectedTitle.text = "What You've Picked!"
            } else {
                selectionsGroup.selectedTitle.text = "Sad Items You Left Behind"
            }
            return selectionsGroup
        }
        return UICollectionReusableView()
    }
    
    
    //Add a new section for the selected items to be displayed.
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return ItemController().selections.count
        } else {
            return ItemController().remainders.count
        }
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "groceryCell", for: indexPath) as? itemProtoCell else {return UICollectionViewCell()}
        
        cell.groceryItem = itemAt(indexPath: indexPath)
        return cell
    }
    
    //
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ItemController().changeSelection(forItem: itemAt(indexPath: indexPath))
        collectionView.reloadData()
    }
    
    //
    func itemAt(indexPath:IndexPath) -> ShoppingItem {
        if indexPath.section == 0 {
            return ItemController().selections[indexPath.row]
        } else {
            return ItemController().remainders[indexPath.row]
        }
        
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderNotify"{
            guard let destinationVC = segue.destination as? GetNotifiedController else {return}
            
            destinationVC.itemController = ItemController()
        }
    }
    
    
    //Default Code, not going to touch you.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

