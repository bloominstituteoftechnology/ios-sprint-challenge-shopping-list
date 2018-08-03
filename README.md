# Shopping List

### Instructions

This sprint challenge is designed to ensure that you are competent with the concepts taught throughout Sprint 2. Please read this entire README to make sure you understand what is expected of you before you begin. Failure to read and follow the instructions and requirements will be reflected in your results.

In your solution, it is especially important that you follow best practices such as MVC and good, consistent code style. You will be scored on these aspects as well as the project requirements below.

Begin by forking this repository. Clone your fork to your local computer. Use the starter project included in the repository, as it contains images in the assets folder and a file you will use. Commit as appropriate while you work. Push your final project to GitHub, then send a link to your GitHub fork to your Project Manager.

**You will have 3 hours to complete this sprint challenge**

Good luck!

### Screen Recording

Please view the screen recording so you will know what your finished project should look like:

![](https://user-images.githubusercontent.com/16965587/43629692-37015176-96bb-11e8-851b-dba8f56f06e0.gif)

(The gif is fairly large in size. It may take a few seconds for it to appear)

## Requirements

1. A `ShoppingItem` model object with properties for an image, name of the item, and `Bool` indicating whether the item has been added to the shopping list.
2. On the first launch of the application, use the given shopping item names and images to create instances of the `ShoppingItem` model, and save them to a file. **These shopping items should be persisted between launches of the application.** Use `UserDefaults` to make sure that new shopping items are initialized only once. 

This snippet has the names of the images in the assets folder. Use it to create the instances of `ShoppingList`:
    - `let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]` 
    
2. A collection view controller that shows a list of shopping items. It should be embedded in a navigation controller.
3. The collection view controller's cell must display all the properties of the shopping item.
4. Upon selecting the custom cell, the item's `Bool` value should change from `true` to `false` or vice-versa.
5. A bar button item on the collection view controller that performs a "Show" segue to a detail `UIViewController`. This `UIViewController` should allow the user to fill in their name and address. It should also display how many items have been added to "shopping list".
6. In the same view controller, add a button that schedules a local notification saying that the user's delivery will be to their address in 15 minutes. The notification's content must contain their name and address.

### Extra Challenges

- Add functionality to add more shopping items.
- Group the shopping items in sections by whether they have been added to the shopping list.
