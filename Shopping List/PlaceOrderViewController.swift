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

        // Do any additional setup after loading the view.
    }
    var orderTotal: Int = 0
   
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var addressLabel: UITextField!
    
    @IBAction func placeOrderButtonPressed(_ sender: Any) {
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
