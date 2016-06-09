//
//  AppDelegate.swift
//  friendly
//
//  Created by Daniel Christopher on 5/30/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: UIControlState.Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.darkGrayColor()], forState: UIControlState.Normal)
        
        // Change tab bar item appearance
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSFontAttributeName: UIFont(name:"ProximaNovaSoft-Regular", size:13)!,
                NSForegroundColorAttributeName: UIColor.darkGrayColor()],
            forState: .Normal)
        
        UINavigationBar.appearance().tintColor = UIColor.blackColor()
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}