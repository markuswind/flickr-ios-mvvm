//
//  PhotosPopularStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class PhotosRecentStore: Store {

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

  // MARK: - Result Parsing

  private func parsePhotos(value: JSON) -> [Photo] {
    var photos: [Photo] = []

    for photoValues in value["photos"]["photo"].arrayValue {
      photos.append(Photo(values: photoValues))
    }

    return photos
  }

  private func parseMetaData(value: JSON) -> [String: Any] {
    var metaData: [String: Int] = [:]

    metaData["currentPage"] = value["photos"]["page"].intValue
    metaData["totalPages"] = value["photos"]["pages"].intValue

    return metaData
  }

}

