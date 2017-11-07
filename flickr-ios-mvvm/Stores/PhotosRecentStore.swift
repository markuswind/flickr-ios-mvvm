//
//  PhotosPopularStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class PhotosRecentStore: PhotosStore {

  // MARK: - Lifecycle

  init() {
    super.init(method: "flickr.photos.getRecent")
  }

  // MARK: - API Request

  func requestPhotos(page: Int, itemsPerPage: Int, completion:@escaping ([Photo], [String: Any]) -> ()) {
    let parameters = "&page=\(page)&per_page=\(itemsPerPage)"

    getRequest(parameters: parameters) { (value) in
      let photos = self.parsePhotos(value: value)
      let metaData = self.parseMetaData(value: value)

      completion(photos, metaData)
    }
  }

}

