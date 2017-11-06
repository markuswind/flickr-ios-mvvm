//
//  PhotoCollectionViewModel.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

class PhotoCollectionViewModel {

  static let reuseIdentifier = "PhotoCollectionViewCell"

  static let itemsPerPage = 30
  static let itemsPerRow = 2
  static let itemsPerSection = 10
  static let itemsTreshold = itemsPerPage / 2

  let photosSearchText: String!
  let photosStore: PhotosStore!

  var photosData: [Photo] = []
  var currentPage = 0
  var totalPages = 0

  init(searchText: String) {
    photosSearchText = searchText
    photosStore = PhotosStore()
  }

}
