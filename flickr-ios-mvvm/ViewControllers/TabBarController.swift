//
//  TabController.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let searchNavigationViewController = createSearchNavigationViewController()
    let tempSearchNavigationViewController = createSearchNavigationViewController()

    self.viewControllers = [searchNavigationViewController, tempSearchNavigationViewController]
  }

  private func createSearchNavigationViewController() -> NavigationController {
    let searchViewModel = SearchViewModel()
    let searchViewController = SearchViewController(withViewModel: searchViewModel)
    let searchNavigationController = NavigationController(rootViewController: searchViewController)

    let tabBarItem = UITabBarItem(title: "Search", image: nil, selectedImage: nil)
    searchNavigationController.tabBarItem = tabBarItem

    return searchNavigationController
  }

}
