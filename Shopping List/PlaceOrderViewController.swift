//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Chris Gonzales on 1/31/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    
    @IBOutlet weak var orderInformationLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func placeOrderButton(_ sender: UIButton) {
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
