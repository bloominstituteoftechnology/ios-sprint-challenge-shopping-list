//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let foodItems = ["Apples", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
        
    }
    
    func collectionView (_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(_: withReuseIdentifier,: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.myLabel.text = items[indexPath.item]
        
        return cell
    
    }
    
    
    }




