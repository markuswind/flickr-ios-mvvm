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

  let methodURL = "method=flickr.photos.search&format=json&nojsoncallback=1"

  // MARK - API Request

  func requestPhotos(searchText: String, page: Int, itemsPerPage: Int, completion:@escaping ([Photo], [String: Any]) -> ()) {
    let url = baseURL + methodURL + "&text=\(searchText)&page=\(page)&per_page=\(itemsPerPage)"

    getRequest(url: url) { (value) in
      let photos = self.parsePhotos(value: value)
      let metaData = self.parseMetaData(value: value)

      completion(photos, metaData)
    }
  }

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
