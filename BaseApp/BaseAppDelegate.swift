//
//  AppDelegate.swift
//  BaseApp
//
//  Created by Aswani Gangadharan on 11/18/19.
//  Copyright © 2019 RAS. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseCrashlytics

@UIApplicationMain
open class BaseAppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?
    public let navigationController = UINavigationController()

//    func initializeRealm(){
//        let realm = try! Realm()
//        guard realm.isEmpty else { return }
//    }

    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.setMinimumBackgroundFetchInterval(60)
        if NSClassFromString("XCTest") != nil {
            return true
        } else {
            FirebaseApp.configure()
        }
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        settings.cacheSizeBytes = FirestoreCacheSizeUnlimited

        // Enable offline data persistence
        let db = Firestore.firestore()
        db.settings = settings

        //Realm
        //initializeRealm()
    
        routeToRootViewController()
        
        /*
         //find all font from Xcode
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                   print("== \(names)")
            }
        }*/

        return true
    }
    
    open func routeToRootViewController() {
        let login = BaseRootViewController()
        navigationController.viewControllers = [login]
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
    }

    public func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension UIWindow {
    override open func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        #if !Production
        if motion == .motionShake {
            let ac = UIAlertController(title: "Tools", message: nil, preferredStyle: .actionSheet)
            let mockCrashAction = UIAlertAction(title:"Mock Crash", style: .default, handler: { _ in
                Crashlytics.crashlytics().setUserID("user_id")
                fatalError()
            })
            let openWebKit = UIAlertAction(title: "Web Kit Test", style: .default, handler: { _ in
                self.rootViewController?.present(WebViewController(), animated: true)
            } )
            
            ac.addAction(mockCrashAction)
            ac.addAction(openWebKit)
            rootViewController?.present(ac, animated: true, completion: {
                ac.view.superview?.isUserInteractionEnabled = true
                ac.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
            })
        }
        #endif
    }
    
    @objc private func dismissOnTapOutside()
    {
       rootViewController?.dismiss(animated: true, completion: nil)
    }
}
