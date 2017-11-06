//
//  PhotosStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

class PhotosStore: Store {

  // MARK: - Properties

  let methodURL = "?method=flickr.photos.search&format=json&nojsoncallback=1"

  // MARK - API Request

  func requestPhotos(searchText: String, page: Int, itemsPerPage: Int, completion: ([Photo]) -> ()) {
    let url = baseURL + methodURL + "&text=\(searchText)&page=\(page)&per_page=\(itemsPerPage)"

    // TODO: - request & return parsed models
  }

}
