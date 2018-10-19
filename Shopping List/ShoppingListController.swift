// ShoppingListController.swift
//  Lotanna iOS3 Sprint 2 Challenge begins!

import UIKit

class ShoppingListController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering the cell class
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "groceryCell")
        
    }

    
    
    
    
    
    
    
    
    //Default Code, not going to touch you.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

