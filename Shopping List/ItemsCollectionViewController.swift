//
//  ItemsCollectionViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class ItemsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

		
    }

 
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
		
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
		
    
        return cell
    }

  
}
