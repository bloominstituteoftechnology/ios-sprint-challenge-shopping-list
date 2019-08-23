//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Jordan Christensen on 8/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet var itemsInCartLabel: UIView!
    @IBOutlet var nameTextField: UIView!
    @IBOutlet var addressTextField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func placeOrderTapped(_ sender: Any) {
        
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
