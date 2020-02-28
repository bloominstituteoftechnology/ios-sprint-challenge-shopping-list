//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Bradley Diroff on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    
    @IBOutlet var howManyLabel: UILabel!
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var addressLabel: UITextField!
    
    var shopList: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = nameLabel.text, let address = addressLabel.text else {return}
        
        let alert = UIAlertController(title: "\(name), your order is coming!", message: "Delivery will be arriving at \(address).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Alright", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func updateViews() {
        guard let shopList = shopList else {
            
            print("It didn't show up?")
            return}
        print("ok so it showed up")
        howManyLabel?.text = "You have \(shopList.count) item(s) in your cart"
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
