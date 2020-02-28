//
//  CartCollectionViewController.swift
//  Shopping List
//
//  Created by Mark Gerrior on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ShoppingItemCell"

class CartCollectionViewController: UICollectionViewController, DeliveryAlertDelegate {

    var timer: Timer?
    var alertDelayInSeconds = 5.0
    var cartController = CartController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.

        if segue.identifier == "ShowCheckout" {
            guard let checkoutVC = segue.destination as? CheckoutViewController else {return}
            checkoutVC.cartController = cartController
            checkoutVC.alertDeligate = self
        }
    }

    // MARK: Alerts
    func showDeliveryAlert() {
        startTimer()
    }
    
    private func showDeliveryAlert(name: String, address: String, inMinutes: Int = 15) {
        let alert = UIAlertController(title: "Delivery for \(name)!",
            message: "Your shopping items will be delivered to \(address) in \(inMinutes) minutes.",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }

    // MARK: Timers
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: alertDelayInSeconds,
                                     repeats: false,
                                     block: timerFired(timer:))
    }

    func timerFired(timer: Timer) {
        cancelTimer()
        
        showDeliveryAlert(name: cartController.name, address: cartController.address)
    }
        
    func cancelTimer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ShoppingItemCollectionViewCell else { fatalError("ShoppingItemCollectionViewCell was expected" ) }
        
        // Configure the cell
        cell.shoppingItem = cartController.cart[indexPath.item] // same as .row

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
