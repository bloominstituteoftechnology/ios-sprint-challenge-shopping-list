//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Bobby Keffury on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    @IBOutlet weak var infoDetailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateviews() {
        
        infoDetailLabel.text = "You currently have \() item(s) in your shopping list. "
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sendOrderTapped(_ sender: Any) {
    }
    
    
}
