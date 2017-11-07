//
//  PhotoPopularCollectionViewModel.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

class PhotosRecentCollectionViewModel: PhotosCollectionViewModel {

  // MARK: - Static Properties
  var reuseIdentifier = "PhotosRecentViewCell"

  var itemsPerPage = 30
  var itemsPerRow = 2
  var itemsPerSection = 10
  var itemsTreshold = 30 / 2

  // MARK: - Properties

  let photosRecentStore: PhotosRecentStore
  let navigationTitle: String

  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0

  // MARK: - Lifecycle

  init() {
    navigationTitle = "Recent"
    photosRecentStore = PhotosRecentStore()
  }

  // MARK: - Data Interaction

  func requestNextPhotosPage(completion:@escaping () -> ()) {
    currentPage += 1

    photosRecentStore.requestPhotos(page: currentPage, itemsPerPage: itemsPerPage) { (photos, metaData) in
      self.photosData.append(contentsOf: photos)

      self.currentPage = metaData["currentPage"] as! Int
      self.totalPages = metaData["totalPages"] as! Int

      completion()
    }
  }

}
