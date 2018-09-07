//
//  AddNewItemViewController.swift
//  Shopping List
//
//  Created by Daniela Parra on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func saveItem(_ sender: Any) {
        guard let name = nameTextField.text,
            let image = itemImageView.image else { return }
        
        
    }
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
}
