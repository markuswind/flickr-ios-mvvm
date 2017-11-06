//
//  PhotosStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class PhotosStore: Store {

  // MARK: - Properties

  let methodURL = "?method=flickr.photos.search&format=json&nojsoncallback=1"

  // MARK - API Request

  func requestPhotos(searchText: String, page: Int, itemsPerPage: Int, completion:@escaping ([Photo]) -> ()) {
    let url = baseURL + methodURL + "&text=\(searchText)&page=\(page)&per_page=\(itemsPerPage)"

    getRequest(url: url) { (value) in
      var result: [Photo] = []

      let photos = value["photos"].arrayValue
      for photo in photos {
        result.append(Photo(values: photo))
      }

      completion(result)
    }
  }

}
