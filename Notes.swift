//
//  Notes.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
//A custom Collection View Controller that shows a list of shopping items.





//A ShoppingItem model object with properties:
//A name of the item ("Apple").
//A Bool indicating whether the item has been added to the shopping list.
//You will need to make a computed property that initializes a UIImage from the name of the item.
//The shopping items should be persisted between launches of the application. On the first launch of the application, use the given shopping itemNames to create instances of the ShoppingItem model, and save them to a file using FileManager. To help you do this, read the following substeps:
//Use this snippet of names of images from the asset catalog to create instances of items in the ShoppingList model controller:
//
// let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
//Use a Bool and the UserDefaults to make sure that new shopping items are initialized only once.
//
//Save the shopping list to a file using a PropertyListEncoder as the user makes changes.
//
//Test and verify that your app saves and loads changes to the shopping list (quit and relaunch the app).
//
//A custom Collection View Controller that shows a list of shopping items.
//The Collection View Controller should be embedded in a navigation controller.
//A custom Collection View Controller Cell must display all the properties of the shopping item.
//Upon selecting the custom cell, the item's Bool value should change from true to false or vice-versa. You can know when a cell has been selected by using the didSelectItemAt method in the UICollectionViewDelegate protocol
//A bar button item on the Collection View Controller that performs a "Show" segue to a detail UIViewController subclass. This UIViewController should allow the user to fill in their name, address, and submit the order.
//The detail View Controller should display how many items have been added to the "shopping list".
//In the detail view controller, add a button "Submit Order" that creates a UIAlert saying the user's order will be delivered in 15 minutes to the user's address.
//The alert must include the user's name in the title
//The alert must include the address in the message
//Extra Challenges
//
//Schedule a local notification instead of the alert saying that the user's order will be delivered to their address in 15 minutes.
//The notification's content must contain the users name and address (schedule it 5-10 seconds into the future for demo purposes).
//Research UNUserNotificationCenter and UNMutableNotificationContent.
//Add functionality to add more shopping items.
//Group the shopping items in sections by whether they have been added to the shopping list.
