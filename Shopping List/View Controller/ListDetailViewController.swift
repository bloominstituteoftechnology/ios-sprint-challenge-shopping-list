//
//  ListDetailViewController.swift
//  Shopping List
//
//  Created by Michael Flowers on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    var sc: ShoppingController?
    
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
        guard let name = nameLabel.text, !name.isEmpty, let address = addressLabel.text, !address.isEmpty else { return }
        alert(userName: name, userAddress: address)
    }
    
    func alert(userName: String, userAddress: String){
        let alert = UIAlertController(title: "Alert message", message: "\(userName), your order will be delivered in 15 minutes to this address you've provided: \(userAddress)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true) }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateLabel(){
        guard let number = sc?.hasBeenAddedArray.count, isViewLoaded else {return }
        var text = ""
        switch number {
        case 0:
             text = "You currently have \(number) items in your shopping cart"
        case 1:
            text = "You currently have \(number) item in your shopping cart"
        case 2...100:
            text = "You currently have \(number) items in your shopping cart"
        default:
            text = "Error, cannot determine how many things you have in your shopping cart."
        }
        shoppingLabel.text = text
    }
}
