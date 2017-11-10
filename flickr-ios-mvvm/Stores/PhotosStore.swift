//
//  PhotosStore.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 07/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class PhotosStore: Store {

  // MARK: - Lifecycle

  override init(method: String) {
    super.init(method: method)
  }

  // MARK: - Result Parsing

  func parsePhotos(value: JSON) -> [Photo] {
    var photos: [Photo] = []

    for photoValues in value["photos"]["photo"].arrayValue {
      photos.append(Photo(values: photoValues))
    }

    return photos
  }

  func parseMetaData(value: JSON) -> [String: Any] {
    var metaData: [String: Int] = [:]

    metaData["currentPage"] = value["photos"]["page"].intValue
    metaData["totalPages"] = value["photos"]["pages"].intValue

    return metaData
  }

}
