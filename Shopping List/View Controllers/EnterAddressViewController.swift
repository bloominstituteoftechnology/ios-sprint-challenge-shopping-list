//
//  EnterAddressViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_259 on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class EnterAddressViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var numberOfItemsLabel: UILabel!
    @IBOutlet var enterNameTextField: UITextField!
    @IBOutlet var enterAddressTextField: UITextField!
    
    
    // MARK: - IBActions
    @IBAction func sendOrderButton(_ sender: Any) {
        guard let name = enterNameTextField.text,
            !name.isEmpty,
            let address = enterAddressTextField.text,
            !address.isEmpty else { return }
        
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
