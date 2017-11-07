//
//  SearchPhotoCollectionViewModel.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

class SearchPhotoCollectionViewModel: PhotoCollectionViewModel {

  // MARK: - Static Properties
  var reuseIdentifier = "PhotoCollectionViewCell"

  var itemsPerPage = 30
  var itemsPerRow = 2
  var itemsPerSection = 10
  var itemsTreshold = 30 / 2

  // MARK: - Properties

  let photosSearchText: String
  let photosStore: PhotosStore

  let navigationTitle: String

  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0

  // MARK: - Lifecycle

  init(searchText: String) {
    navigationTitle = searchText
    photosSearchText = searchText
    photosStore = PhotosStore()
  }

  // MARK: - Data Interaction

  func requestNextPhotosPage(completion:@escaping () -> ()) {
    currentPage += 1

    photosStore.requestPhotos(searchText: photosSearchText, page: currentPage, itemsPerPage: itemsPerPage) { (photos, metaData) in
      self.photosData.append(contentsOf: photos)

      self.currentPage = metaData["currentPage"] as! Int
      self.totalPages = metaData["totalPages"] as! Int

      completion()
    }
  }

}

