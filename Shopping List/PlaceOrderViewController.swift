//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    var orderTotal: Int = 0

    
    @IBOutlet weak var orderLabel: UILabel!
    

    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var addressLabel: UITextField!
    
    @IBAction func placeOrderButtonPressed(_ sender: Any) {
        presentOrderPlaced()
    }

    func presentOrderPlaced() {

        let alert = UIAlertController(title: "Order placed for \(nameLabel!.text ?? "something")", message: "Your order for \(orderTotal) item('s) will be delievered to \(addressLabel!.text ?? "your home address").", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func updateViews() {
        orderLabel.text = "You have \(orderTotal) item('s) in your shopping List"

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

