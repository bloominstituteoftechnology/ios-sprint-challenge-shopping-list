//
//  DetailVC.swift
//  Shopping List
//
//  Created by Kenny on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shopper: ShoppingController?
    //refactoring, but need to save time
    var items: [ShoppingItem]? {
        shopper?.itemsToDeliver
    }
    var address: String?
    var name: String?
    
    var friendlyList: [String] {
        guard let items = items else {return []}
        var outputList: [String] = []
        for item in items {
            outputList.append(item.name)
        }
        return outputList
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        deliverList()
        if name != nil && address != nil {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addressTextField.delegate = self
        print(items ?? "No Items")
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
    
    //MARK: Helper Methods
    func deliverList() {
        //unwrap name and address. show alert if nil
        guard let _ = name,
              let _ = address else {
                //MARK:unwrap textField.text and attempt to set name and address
                guard let nameText = nameTextField.text,
                nameText != "" else {
                    Alert.show(title: "Please Enter a name.", message: "", vc: self)
                    return
                }
                self.name = nameText
                guard let addressText = addressTextField.text,
                addressText != "" else {
                    Alert.show(title: "Please Enter an address.", message: "", vc: self)
                    return
                }
                self.address = addressText
                if friendlyList.count > 0 {
                    Alert.show(title: "Thanks, \(self.name!)! We're on Our Way!", message: "your \(friendlyList) will be delivered to \(self.address!)", vc: self)
                } else {
                    Alert.show(title: "Unknown Error", message: "Sorry, \(self.name!) you order wasn't accepted. Please try again. Thanks for your patience!", vc: self)
                }
            return
        }
        

    }

}

extension DetailVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return false}
        switch textField {
        case nameTextField:
            name = text
            resignFirstResponder()
            addressTextField.becomeFirstResponder()
        case addressTextField:
            address = text
            resignFirstResponder()
            default:
            resignFirstResponder()
        }
        return true
    }
}
