//
//  DetailViewController.swift
//  Sprint2
//
//  Created by Diante Lewis-Jolley on 5/3/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {

        guard let nameText = nameTextField.text,
            let addressText = addressTextField.text else { return }
        alert(name: nameText, address: addressText)
        
        
    }

    func alert(name: String, address: String){
        let alert = UIAlertController(title: "Alert message", message: "\(name), your order was successful: \(address)", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true) }))

        present(alert, animated: true, completion: nil)
    }

    func updateViews() {
        guard isViewLoaded else { return }
        guard let shoppingList = shoppingController?.likedItems else { return }

        likeItemsLabel.text = "You currently have \(shoppingList.count) in your shopping List."
    }
    


    @IBOutlet weak var likeItemsLabel: UILabel!
    var shoppingController: ShoppingController?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!

}
