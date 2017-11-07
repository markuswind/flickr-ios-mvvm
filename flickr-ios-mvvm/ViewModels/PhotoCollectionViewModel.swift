//
//  PhotoCollectionViewModel.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

protocol PhotoCollectionViewModel {

  var reuseIdentifier: String { get }

  var itemsPerPage: Int { get }
  var itemsPerRow: Int { get }
  var itemsPerSection: Int { get }
  var itemsTreshold: Int { get }

  var navigationTitle: String { get }

  var photosData: [Photo] { get set }
  var currentPage: Int { get set }
  var totalPages: Int { get set }

  func requestNextPhotosPage(completion:@escaping () -> ())

}
