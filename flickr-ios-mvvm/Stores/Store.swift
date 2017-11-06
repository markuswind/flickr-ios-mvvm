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
  let apiKey: String
  let apiSecret: String

  // MARK: - Lifecycle

  init(method: String) {
    guard let path = Bundle.main.path(forResource: "Configuration", ofType: "plist") else {
      fatalError("You probably forgot to add a configuration file.. (see: SupportingFiles/Configuration.plist.example)")
    }

    guard let configDictionary = NSDictionary(contentsOfFile: path) else {
      fatalError("Something went wrong when loading configurion file..")
    }

    guard let apiKey = configDictionary["apiKey"] as? String,
          let apiSecret = configDictionary["apiSecret"] as? String else {
      fatalError("Something went wrong when loading apiKey/apiSecret..")
    }

    self.apiKey = apiKey
    self.apiSecret = apiSecret
    self.method = method
  }

  // MARK: - API Requests

  func getRequest(parameters: String, completion:@escaping (JSON) -> ()) {
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

