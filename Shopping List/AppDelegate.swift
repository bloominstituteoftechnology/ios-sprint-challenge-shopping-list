//
//  AppDelegate.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self // set the delegate of the notification center for this notification
        // request authorization for notifications
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if let error = error {
                NSLog("There was an error request auth from notifications: \(error)")
            }
            
            NSLog("Notifications authorization granted? \(granted)")
        }
        
        return true
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, // notification handler
        willPresent notification: UNNotification, // the notification which is about to be presented
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // this gets called right before the notification when your app is running in the foreground
        print("The notification arrived!")
        
        // to make banner show up, we call the completion handler with the notification type (alert, carPlay, sound, badge)
        completionHandler([.alert, .sound])
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

