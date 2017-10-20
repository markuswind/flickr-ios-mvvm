//
//  NavigationController.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBarStyling()
    }

    private func configureNavigationBarStyling() {
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = true

        navigationBar.tintColor = .white
        navigationBar.barTintColor = .darkGray
    }

}
