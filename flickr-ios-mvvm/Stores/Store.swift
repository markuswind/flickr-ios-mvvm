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

  let baseURL = "https://api.flickr.com/services/rest/?"
  let apiKey: String!
  let apiSecret: String!

  // MARK: - Lifecycle

  init() {
    guard let path = Bundle.main.path(forResource: "configuration", ofType: "plist") else {
      fatalError("You probably forgot to add a configuration file..")
    }

    guard let configDictionary = NSDictionary(contentsOfFile: path) else {
      fatalError("Something went wrong when loading configurion file..")
    }

    apiKey = configDictionary["apiKey"] as! String
    apiSecret = configDictionary["apiSecret"] as! String
  }

  // MARK: - API Requests

  func getRequest(url: String, completion:@escaping (JSON) -> ()) {
    let url = url + "&api_key=\(apiKey)"

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

