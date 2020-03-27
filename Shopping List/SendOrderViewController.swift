//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var howManyLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    
    var shopList: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = nameLabel.text, let address = addressLabel.text else {return}

            let alert = UIAlertController(title: "\(name), your order is coming!", message: "Your delivery will be arriving in 15 minutes at \(address).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            self.present(alert, animated: true)
        }

    func updateViews() {
        guard let shopList = shopList else {
            print("Did it show up?")
            return}
        
        print("It showed up")
        howManyLabel?.text = "You have \(shopList.count) item(s) in your cart"
    }

}

