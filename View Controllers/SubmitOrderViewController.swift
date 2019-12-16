//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount: Int?
    var delegate: [ShoppingItem]? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func updateViews() {
               guard let itemCount = itemCount else { return }

               itemsLabel.text = "You have \(itemCount) item(s) in your shopping list."
           }
    
    //MARK: - IBActions
    @IBAction func orderSent(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text, let count = delegate?.count else { return }
      
        let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your items will be delivered \(count) item(s) to \(address) in 15 minutes.", preferredStyle: .alert)
            


        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         present(alert, animated: true)
        }
    


}
