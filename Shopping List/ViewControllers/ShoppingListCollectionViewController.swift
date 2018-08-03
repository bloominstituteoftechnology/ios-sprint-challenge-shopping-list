//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    let shoppingItemController = ShoppingItemController()
    let notificationHelper = LocalNotificationHelper()
    let cellId = "shoppingItemCell"
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(ShoppingItemCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsetsMake(12, 12, 0, 12)
        setupNavBar()
    }
    
    private func setupNavBar()
    {
        title = "Shopping List"
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddNewShoppingItem))
        let nextBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNextButton))
        navigationItem.rightBarButtonItems = [nextBarButtonItem, addBarButtonItem]
    }
    
    @objc private func handleAddNewShoppingItem()
    {
        let addShoppingItemViewController = AddShoppingItemViewController()
        addShoppingItemViewController.shoppingItemController = self.shoppingItemController
        navigationController?.pushViewController(addShoppingItemViewController, animated: true)
    }
    
    @objc func handleNextButton()
    {
        var selectedShoppingItems = [ShoppingItem]()
        for item in shoppingItemController.shoppingItems
        {
            if item.isSelected
            {
                selectedShoppingItems.append(item)
            }
        }
        
        if selectedShoppingItems.isEmpty
        {
            let alert = UIAlertController(title: "Empty shopping list", message: "Please add at least one shopping item to your shopping list.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        let sendOrderViewController = SendOrderViewController()
        sendOrderViewController.selectedShoppingItems = selectedShoppingItems
        sendOrderViewController.notificationHelper = self.notificationHelper
        navigationController?.pushViewController(sendOrderViewController, animated: true)
    }

    //MARK: - DataSource & FlowLayout
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return shoppingItemController.shoppingItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ShoppingItemCell
        
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        
        cell.didSelectImageView.isHidden = shoppingItem.isSelected ? false : true
        cell.shoppingItemImageView.image = UIImage(data: shoppingItem.imageData)
        cell.shoppingItemNameLabel.text = shoppingItem.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 150, height: 150)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! ShoppingItemCell
        let shoppingItem = shoppingItemController.shoppingItems[indexPath.item]
        self.shoppingItemController.didSelectShoppingItem(on: shoppingItem)
        
        UIView.animate(withDuration: 0.3)
        {
            cell.didSelectImageView.isHidden = shoppingItem.isSelected ? true : false
        }
    }
    

}
















