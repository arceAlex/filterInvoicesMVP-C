//
//  AppDelegate.swift
//  InvoicesUIKit
//
//  Created by Alejandro Arce on 4/8/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator.start()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
}

