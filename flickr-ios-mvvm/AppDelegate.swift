//
//  AppDelegate.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let searchViewController = createSearchViewController()

    let navigationController = NavigationController()
    navigationController.viewControllers.append(searchViewController)

    window = createWindow(rootViewController: navigationController)
    window!.makeKeyAndVisible()

    return true
  }

  private func createSearchViewController() -> SearchViewController{
    let searchViewModel = SearchViewModel()
    let searchViewController = SearchViewController(withViewModel: searchViewModel)

    return searchViewController
  }

  private func createWindow(rootViewController: UIViewController) -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)

    window.tintColor = UIColor.darkGray
    window.rootViewController = rootViewController

    return window
  }

}
