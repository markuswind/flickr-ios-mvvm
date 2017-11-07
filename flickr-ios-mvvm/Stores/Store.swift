//
//  Store.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Alamofire
import SwiftyJSON

class Store {

  // MARK: - Properties

  let baseURL = "https://api.flickr.com/services/rest/"
  let format = "&format=json&nojsoncallback=1"

  let method: String

  // MARK: - Lifecycle

  init(method: String) {
    self.method = method
  }

  // MARK: - API Requests

  func getRequest(parameters: String, completion:@escaping (JSON) -> ()) {
    let apiKey = ApiConstants.shared.apiKey
    let url = baseURL + "?method=\(method)\(format)\(parameters)&api_key=\(apiKey)"

    Alamofire.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
        case .success(let value):
          completion(JSON(value))
        case .failure(let error):
          print("Failed request with given url: \(url)", error)
          completion(JSON.null)
      }
    }
  }

}

