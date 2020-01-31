//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ShoppingListCollectionViewController: UICollectionViewController {
    
    
    // MARK - Properties
    
    var shoppingList = [ShoppingItem]()
    var shoppingListController = ShoppingListController()
    var shoppingListURL: URL?{
        let fileManager = FileManager.default
        
        guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil}
        
        let listURL = documentsDir.appendingPathComponent("ShoppingList.plist")
        
        return listURL
    }
    
    // MARK - Life Cycle ((Is that the correct term?))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
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

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItemViewCell", for: indexPath) as? ShoppingListCollectionViewCell else { return UICollectionViewCell()}
        let shoppingItem = shoppingListController.shoppingItems[indexPath.row]
        cell.shoppingItemImage.image = shoppingItem.shoppingItemImage
        cell.shoppingItemDescription.text = shoppingItem.name
        return cell
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

  

    @IBAction func unwindToShoppingVC (_ sender: UIStoryboardSegue){
        
    }
    
    // MARK - Persistence
    
    func saveToPersistentStore(){
        
        guard let shoppingListURL = shoppingListURL else { return }
        
        let encoder = PropertyListEncoder()
        do{
            let listData = try encoder.encode(shoppingList)
            try listData.write(to: shoppingListURL)
        } catch {
            print("Error encoding books array: \(error)")
        }
    }
    
    func loadFromPersistnetStore (){
        
        guard let shoppingListURL = shoppingListURL else { return }
        
        do{
            let decoder = PropertyListDecoder()
            
            let shoppingListData = try Data(contentsOf: shoppingListURL)
            
            let shoppingListArray = try decoder.decode([ShoppingItem].self, from: shoppingListData)
        } catch{
            print("Error decoding readList: \(error)")
        }
    }
    
}
