//
//  Photo.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

class Photo: Model {

  private let farm: Int
  private let server: Int
  private let id: Int
  private let secret: String
  private let title: String

  required init(values: JSON) {
    self.farm = values["farm"].intValue
    self.server = values["server"].intValue
    self.id = values["id"].intValue
    self.secret = values["secret"].stringValue
    self.title = values["title"].stringValue
  }

}

extension Photo {

  func imageURL() -> String {
    return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
  }

}
