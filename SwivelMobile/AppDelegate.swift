//
//  AppDelegate.swift
//  SwivelMobile
//
//  Created by Jonathen Chen on 2016-04-30.
//  Copyright © 2016 Swivel Systems. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //Make Things White
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        //Styling
        let attrs = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Roboto-Bold", size: 18)!
        ]
    
        UINavigationBar.appearance().titleTextAttributes = attrs
        UINavigationBar.appearance().barTintColor = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()


        //Loading the data into Singleton //uncomment to connect to server
        Package.sharedInstance.update()

        //Loading Complete and Enter application
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

        //Connect Socket
        SocketIOManager.sharedInstance.establishConnection()
    }

    func applicationWillTerminate(application: UIApplication) {

        //Disconnect Socket
        SocketIOManager.sharedInstance.closeConnection()
    }


}

