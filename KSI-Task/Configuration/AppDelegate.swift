//
//  AppDelegate.swift
//  KSI-Task
//
//  Created by eslam dweeb on 08/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator:AppCoordinator!
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        appCoordinator = .init(window: window!)
        appCoordinator.start()
        return true
    }


}

