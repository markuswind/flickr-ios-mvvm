//
//  SearchPhotoCollectionViewModel.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

class PhotosSearchCollectionViewModel: PhotosCollectionViewModel {

  // MARK: - Static Properties

  let reuseIdentifier = "PhotosSearchViewCell"

  let itemsPerPage = 30
  let itemsPerRow = 2
  let itemsPerSection = 10
  let itemsTreshold = 15

  // MARK: - Properties

  let photosSearchText: String
  let photosSearchStore: PhotosSearchStore
  let navigationTitle: String

  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0

  // MARK: - Lifecycle

  init(searchText: String) {
    navigationTitle = searchText
    photosSearchText = searchText
    photosSearchStore = PhotosSearchStore()
  }

  // MARK: - Data Interaction

  func requestNextPhotosPage(completion:@escaping () -> ()) {
    currentPage += 1

    photosSearchStore.requestPhotos(searchText: photosSearchText, page: currentPage, itemsPerPage: itemsPerPage) { (photos, metaData) in
      self.photosData.append(contentsOf: photos)

      self.currentPage = metaData["currentPage"] as! Int
      self.totalPages = metaData["totalPages"] as! Int

      completion()
    }
  }

}

