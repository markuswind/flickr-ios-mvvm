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

    let photosRecentNavigationController = createPhotosRecentNavigationController()
    let searchNavigationViewController = createSearchNavigationViewController()

    self.viewControllers = [photosRecentNavigationController, searchNavigationViewController]
  }

   private func createPhotosRecentNavigationController() -> NavigationController {
    let photosRecentViewModel = PhotosRecentCollectionViewModel()
    let photosCollectionViewController = PhotosCollectionViewController(withViewModel: photosRecentViewModel)
    let photosRecentNavigationController = NavigationController(rootViewController: photosCollectionViewController)

    let tabBarItem = UITabBarItem(title: "Recent", image: nil, selectedImage: nil)
    photosRecentNavigationController.tabBarItem = tabBarItem

    return photosRecentNavigationController
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

