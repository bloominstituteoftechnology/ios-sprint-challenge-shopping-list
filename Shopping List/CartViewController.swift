//
//  CartViewController.swift
//  Shopping List
//
//  Created by Craig Belinfante on 6/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBAction func sendOrder(_ sender: Any) {
    }
    
    
    
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

}
