//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addItems(items: <#Int#>)
    }
    
    // MARK: - Methods
    func alert() {
        guard let name = nameText.text,
            let address = addressText.text else { return }
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        alert()
    }
    

}

extension DetailViewController: NumberOfItemsDelegate {
    func addItems(items: Int) {
        descriptionLabel.text = "You currently have \(items) item(s) in your shopping list."
    }
    
    
}
