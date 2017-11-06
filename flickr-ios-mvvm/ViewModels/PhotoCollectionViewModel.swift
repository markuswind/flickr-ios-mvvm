//
//  PhotoCollectionViewModel.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

class PhotoCollectionViewModel {

  // MARK: - Static Properties

  static let reuseIdentifier = "PhotoCollectionViewCell"

  static let itemsPerPage = 30
  static let itemsPerRow = 2
  static let itemsPerSection = 10
  static let itemsTreshold = itemsPerPage / 2

  // MARK: - Properties

  let photosSearchText: String!
  let photosStore: PhotosStore!

  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0

  // MARK: - Lifecycle

  init(searchText: String) {
    photosSearchText = searchText
    photosStore = PhotosStore()
  }

  // MARK: - Data Interaction

  func requestNextPhotosPage(completion:@escaping () -> ()) {
    currentPage += 1

    photosStore.requestPhotos(searchText: photosSearchText, page: currentPage, itemsPerPage: PhotoCollectionViewModel.itemsPerPage) { (photos, metaData) in
      self.photosData.append(contentsOf: photos)

      self.currentPage = metaData["currentPage"] as! Int
      self.totalPages = metaData["totalPages"] as! Int

      completion()
    }
  }

}
