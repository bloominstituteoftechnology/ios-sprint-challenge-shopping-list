//
//  ShoppingListDetailViewController.swift
//  ShoppingList
//
//  Created by Lambda_School_Losaner_256 on 1/31/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit
import Photos

class ShoppingListDetailViewController: UIViewController {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailName: UITextField!
    @IBOutlet weak var detailAddress: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    showAlert()
    }
    
    var shoppingList = ShoppingList()
    
    func showAlert() {
        let alert = UIAlertController(title: "Your Order Has Been Submitted", message: "\(String(describing: orderName.text!)), your order will be delivered in 15 minutes to \(String(describing: orderAddress.text!))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
           orderLabel.text = "You have \(shoppingListController.addedItems.count) item(s) in your cart"
       }
    
    
    
    // Do any additional setup after loading the view.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


