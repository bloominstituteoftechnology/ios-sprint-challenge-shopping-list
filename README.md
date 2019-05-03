# Shopping List

This sprint challenge is designed to ensure that you are competent with the concepts taught throughout Sprint 2. 

## Instructions

Please read this entire README to make sure you understand what is expected of you before you begin. Failure to read and follow the instructions and requirements will be reflected in your results.

In your solution, it is especially important that you follow best practices such as MVC and good, consistent code style. You will be scored on these aspects as well as the project requirements below.

Begin by forking this repository. Clone your fork to your local computer. Use the starter project included in the repository, as it contains images in the assets folder and a file you will use. Commit as appropriate while you work. Push your final project to GitHub, then send a link to your GitHub fork to your Project Manager.

### 20 Minute Rule

You are not allowed to collaborate during the Sprint Challenge. However, you are encouraged to follow the twenty-minute rule and seek support from your PM and Instructor in your cohort help channel on Slack. Your work reflects your proficiency in iOS and your command of the concepts and techniques in this first unit.

**You will have 3 hours to complete this sprint challenge**

Good luck!

### Screen Recording

Please view the screen recording so you will know what your finished project should look like:

![](https://user-images.githubusercontent.com/16965587/43629692-37015176-96bb-11e8-851b-dba8f56f06e0.gif)

(The gif is fairly large in size. It may take a few seconds for it to appear)

## Requirements

1. A `ShoppingItem` model object with properties: 
    1. An image name ("apple")
    2. A name of the item ("Apple")
    3. A `Bool` indicating whether the item has been added to the shopping list
2. On the first launch of the application, use the given shopping *item names* and *image names* to create instances of the `ShoppingItem` model, and save them to a file. **These shopping items should be persisted between launches of the application.** 
    1. On first launch, make a shopping list of `ShoppingItem` from the list of *item names* and *image names*.
    2. Save the shopping list to `UserDefaults` as the user makes changes.
    3. If the shopping list exists in the `UserDefaults`, load the saved data.
    4. Test and verify that your app saves changes to the shopping list (quit the app and relaunch).
    5. This snippet has the names of the images in the assets folder. Use it to create the instances of `ShoppingList`:
    
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
3. A custom Collection View Controller that shows a list of shopping items. 
    1. The Collection View Controller should be embedded in a navigation controller.
4. The custom Collection View Controller's cell must display all the properties of the shopping item.
5. Upon selecting the custom cell, the item's `Bool` value should change from `true` to `false` or vice-versa.
6. A bar button item on the Collection View Controller that performs a "Show" segue to a detail `UIViewController`. This `UIViewController` should allow the user to fill in their name and address, and submit the order.
    1. The detail view controller should display how many items have been added to the "shopping list".
7. In the detail view controller, add a button "Submit Order" that creates a `UIAlert` saying the user's order will be delivered in 15 minutes to the user's address.
    1. The alert must include the user's name in the title
    2. The alert must include the address in the message

### Extra Challenges

- Schedule a local notification instead of the alert saying that the user's order will be delivered to their address in 15 minutes.
    - The notification's content must contain the users name and address (schedule it 5-10 seconds into the future for demo purposes).
    - Research `UNUserNotificationCenter` and `UNMutableNotificationContent`.
- Add functionality to add more shopping items.
- Group the shopping items in sections by whether they have been added to the shopping list.
