//
//  ShoppingUpdateViewController.swift
//  Shopping List
//
//  Created by Dustin Koch on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingUpdateViewController: UIViewController {

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

    //MARK: - Outlets
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        
    }
    
    
}
