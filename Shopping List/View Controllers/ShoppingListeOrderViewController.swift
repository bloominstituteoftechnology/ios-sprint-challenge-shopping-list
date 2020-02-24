//
//  ListDetailViewController.swift
//  Shopping List
//
//  Created by David Williams on 12/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListeOrderViewController: UIViewController {

    @IBOutlet weak var itemsRemainingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func nameTextField(_ sender: Any) {
        // filler to help push and create a pull request
    }
    @IBAction func addressTextField(_ sender: Any) {
         // filler to help push and create a pull request
    }
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Your Order was sent", message: "Order", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
    }
}
