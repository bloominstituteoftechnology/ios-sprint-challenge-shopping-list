//
//  OrderConfirmationViewController.swift
//  Shopping List
//
//  Created by LambdaSchoolVM_Catalina on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

    //IB Outlets
    
    @IBOutlet weak var numberOfItemsInListLbl: UILabel!
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var addressLbl: UITextField!
    
    var delegate: [ShoppingItem]? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        guard let itemCount = delegate?.count else { return }
        self.numberOfItemsInListLbl.text = "Your have \(itemCount) item(s) in your list."
       
    }
    
     //IB Actions
    @IBAction func sendOrderBtnPressed(_ sender: UIButton) {
        guard let name = nameLbl.text,
        let address = addressLbl.text,
            let count = delegate?.count else { return }
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(address) in 15 minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
 
}
