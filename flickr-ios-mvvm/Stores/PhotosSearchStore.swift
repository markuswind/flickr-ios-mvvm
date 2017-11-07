//
//  PhotosStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class PhotosSearchStore: PhotosStore {

  // MARK: -  Lifecycle

  init() {
    super.init(method: "flickr.photos.search")
  }

  // MARK: - API Request

  func requestPhotos(searchText: String, page: Int, itemsPerPage: Int, completion:@escaping ([Photo], [String: Any]) -> ()) {
    let parameters = "&text=\(searchText)&page=\(page)&per_page=\(itemsPerPage)"

    getRequest(parameters: parameters) { (value) in
      let photos = self.parsePhotos(value: value)
      let metaData = self.parseMetaData(value: value)

      completion(photos, metaData)
    }
  }

}
