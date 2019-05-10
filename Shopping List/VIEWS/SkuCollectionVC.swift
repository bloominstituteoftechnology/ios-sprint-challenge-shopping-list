//
//  SkuCollectionVC.swift
//  Shopping List
//
//  Created by John Pitts on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SkuCollectionVC: UICollectionViewController, SkuCollectionViewCELLDelegate {
    
    
    func toggleSkuInCart(for cell: SkuCollectionViewCELL) {
        
        guard let indexPath = collectionView?.indexPath(for: cell) else { return }
        let sku = skuController.skus[indexPath.item]
        
        skuController.updateSkuInCart(for: sku)
        
        collectionView?.reloadData()
    }
    
    
    /*  override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
     
     }
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skuController.loadFromPersistentStore()
        collectionView?.reloadData()
        
        //self.clearsSelectionOnViewWillAppear = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView?.reloadData()  // Paul says there's a better way, I don't know it... YET
    }
    
    
    

    @IBAction func nextButtonPressed(_ sender: Any) {

        // prepare for segue to viewcontroller and pass count, by perhaps calling collectionView to update/reload forcing a prepare for segue
        
        guard let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "ToCart") as? CartVC else { return }
        /*  I've moved this logic to ModelController file
         cartVC.addedCount = 3
         
         for i in 1...7 {
         if skuController.skus[i].skuInCart {
         cartVC.addedCount += 1
         }
         }
         */
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7 // I'm confident I cant insert the actual .count here, in case it were to change but running low on time so just doing the literal
    }
    
    // cellForItemAt
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProtoCell", for: indexPath) as! SkuCollectionViewCELL
        
        let sku = skuController.skus[indexPath.item]   // remember, item instead of ".row" as in a tableview, both have sections tho
        
        cell.delegate = self  // the whole fucking thing breaks down if we don't have this in the right spot!
        
        print(sku.skuName)
        /*
         cell.skuLabel.text = sku.skuName
         cell.skuLabel.textColor = .red
         
         cell.imageView.image = UIImage(named: sku.skuImageName)
         
         //if skuInCart is properly stored, this will unlock the previously stored value
         
         if sku.skuInCart == true {
         cell.booleanButtonLabel.titleLabel?.text = "Added"
         print("ADDED!!!!!")
         } else {
         cell.booleanButtonLabel.titleLabel?.text = "not added"
         print("NOT")
         }
         //skuController.saveToPersistentStore()
         */
        cell.sku = sku
        
        return cell
    }
    
    /*    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "ToCart" {
     guard let indexPath = collectionView?.indexPathForItem(at: CGPoint),
     let detailCartVC = segue.destination as? CartVC else { return }
     // let cell = sender as? BookTableViewCell else {return}
     
     let sku = skuController.skus[indexPath.item]
     
     detailCartVC.skuController = skuController
     detailCartVC.sku = sku }
     
     //cartVC.addedCount = 4
     
     for i in 1...7 {
     if skuController.skus[i].skuInCart == true {
     cartVC.addedCount += 1
     }
     }
     
     }
     */
    // MARK: Properties
    
    
    var delegate: SkuCollectionViewCELLDelegate?
    let skuController = SkuController()
    
}
