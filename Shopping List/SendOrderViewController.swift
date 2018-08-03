//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController
{
    //MARK: - Properties
    
    var selectedShoppingItems: [ShoppingItem]?
    {
        didSet
        {
            guard let shoppingItems = selectedShoppingItems else { return }
            orderLabel.text = "You currently have \(shoppingItems.count) item(s) in your shopping list."
        }
    }
    var notificationHelper: LocalNotificationHelper?
    
    //MARK: - UI Objects
    
    let orderLabel: UILabel =
    {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.sizeToFit()
        label.numberOfLines = 0
        
        return label
    }()
    
    let nameTextField: UITextField =
    {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Name"
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    let addressTextField: UITextField =
    {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Address"
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    let sendOrderButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Send Order", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 6
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleSendOrder), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Your Order"
        view.backgroundColor = .white
        setupUI()
    }
    
    
    @objc private func handleSendOrder()
    {
        notificationHelper?.getAuthorizationStatus(completion: { (status) in
            
            if status != .authorized
            {
                self.requestNotificationAuthorization()
            }
        })
    }
    
    private func requestNotificationAuthorization()
    {
        self.notificationHelper?.requestAuthorization(completion: { (success) in
            
            if success
            {
                guard let name = self.nameTextField.text, let address = self.addressTextField.text else { return }
                self.notificationHelper?.scheuleDailyReminderNotification(name: name, address: address)
            }
            else
            {
                let alert = UIAlertController(title: "We need permission to send you notifications in order for the app to work.", message: "Please grant permission and try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    @objc private func handleEditingChanged()
    {
        guard let name = nameTextField.text, let address = addressTextField.text else { return }
        let isValid = name.count > 1 && address.count > 1
        
        sendOrderButton.isEnabled = isValid ? true : false

        UIView.animate(withDuration: 0.3) {
            self.sendOrderButton.backgroundColor = isValid ? .green : .lightGray
        }
    }
    
    //MARK: - AutoLayout constraints
    
    fileprivate func setupUI()
    {
        view.addSubview(orderLabel)
        view.addSubview(nameTextField)
        view.addSubview(addressTextField)
        view.addSubview(sendOrderButton)
        
        orderLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 12, paddingRight: 12, paddingBottom: 0, width: 0, height: 0)
        
        nameTextField.anchor(top: orderLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 12, paddingRight: 12, paddingBottom: 0, width: 0, height: 30)
        
        addressTextField.anchor(top: nameTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12, paddingBottom: 0, width: 0, height: 30)
        
        sendOrderButton.anchor(top: addressTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 16, paddingLeft: 40, paddingRight: 40, paddingBottom: 0, width: 0, height: 40)
    }
    
    
    
}






















