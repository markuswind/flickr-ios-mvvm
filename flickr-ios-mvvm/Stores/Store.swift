//
//  Store.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Alamofire

class Store {

  // MARK: - Properties

  let baseURL = ""
  let apiKey: String!
  let apiSecret: String!

  // MARK: - Lifecycle

  init() {
    apiKey = ""
    apiSecret = ""
  }

  // MARK: - API Requests

  func getRequest(url: String, completion:@escaping () -> ()) {
    Alamofire.request(url, method: .get).validate().responseJSON { response in
      switch response.result {
        case .success(let value):
          print("value", value)
          completion()
        case .failure(let error):
          print("Failed request with given url: \(url)", error)
          completion()
      }
    }
  }

}

