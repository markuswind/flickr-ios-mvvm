//
//  AppDelegate.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = createNavigationController()

        window = createWindow(rootViewController: navigationController)
        window!.makeKeyAndVisible()

        return true
    }

    private func createNavigationController() -> UINavigationController {
        let navigationController = NavigationController()
        let viewController = ViewController()

        navigationController.viewControllers.append(viewController)

        return navigationController
    }

    private func createWindow(rootViewController: UIViewController) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.tintColor = UIColor.darkGray
        window.rootViewController = rootViewController

        return window
    }

}

