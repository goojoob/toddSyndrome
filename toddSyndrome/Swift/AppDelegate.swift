//
//  AppDelegate.swift
//  toddSyndrome
//
//  Created by Antonio Rodriguez Cia on 30/10/16.
//  Copyright © 2016 Goojoob. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isFirstTime:Bool?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.checkIfIsFirstTimeLoadingApplication()
        self.loadInitialViewBasedOnFirstTime()
        return true
    }

    

    
    //GET FIRST TIME OPENING APPLICATION FROM DATA PERSISTENCE
    
    private func checkIfIsFirstTimeLoadingApplication() {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "hasLaunchedBefore") {
            self.isFirstTime = false
        } else {
            self.isFirstTime = true
            defaults.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    

    
    //LOAD STORYBOARD BASED ON FIRST TIME OR NOT
    
    private func loadInitialViewBasedOnFirstTime() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var initialViewController: UIViewController
        
        if self.isFirstTime! {
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "InfoStoryBoard") as! InfoSlidesController
        } else {
            initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "TestStoryBoard") as! UINavigationController
            
        }
        
        self.window?.rootViewController = initialViewController
        
        self.window?.makeKeyAndVisible()
    }
}

