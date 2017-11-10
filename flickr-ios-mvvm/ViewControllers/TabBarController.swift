//
//  TabController.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  // MARK: - View Lifecycle

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let photosRecentNavigationController = createPhotosRecentNavigationController()
    let searchNavigationViewController = createSearchNavigationViewController()

    self.viewControllers = [photosRecentNavigationController, searchNavigationViewController]
  }

  // MARK: - NavigationControllers Initializers

  private func createPhotosRecentNavigationController() -> NavigationController {
    let photosRecentViewModel = PhotosRecentCollectionViewModel()
    let photosCollectionViewController = PhotosCollectionViewController(withViewModel: photosRecentViewModel)
    let photosRecentNavigationController = NavigationController(rootViewController: photosCollectionViewController)

    photosRecentNavigationController.tabBarItem = createTabBarItem(title: "Recent", imageName: "RecentIcon")

    return photosRecentNavigationController
  }

  private func createSearchNavigationViewController() -> NavigationController {
    let searchViewModel = SearchViewModel()
    let searchViewController = SearchViewController(withViewModel: searchViewModel)
    let searchNavigationController = NavigationController(rootViewController: searchViewController)

    searchNavigationController.tabBarItem = createTabBarItem(title: "Search", imageName: "SearchIcon")

    return searchNavigationController
  }

  // MARK: - TabBarItem initializer

  private func createTabBarItem(title: String, imageName: String) -> UITabBarItem {
    let image = UIImage(named: imageName)
    let selectedImage = UIImage(named: imageName + "Filled")

    return UITabBarItem(title: title, image: image, selectedImage: selectedImage)
  }

}

