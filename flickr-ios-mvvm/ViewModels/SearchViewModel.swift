//
//  SearchViewModel.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

class SearchViewModel {

  static let reuseIdentifier = "SearchViewCell"

  let defaults = UserDefaults.standard
  let searchDataKey = "SearchDataKey"

  var searchData: [String] = []

  func retrieveInitialSearchData(completion: () -> ()) {
    guard let data = defaults.object(forKey: searchDataKey) else {
      fatalError("could not load data forKey \(searchDataKey)")
    }

    searchData = data as! [String]

    completion()
  }

  func saveSearch(text: String, completion: () -> ()) {
    let uniqueSearchData = searchData.filter { $0.lowercased() != text.lowercased() }

    searchData = uniqueSearchData
    searchData.insert(text, at: 0)

    defaults.set(searchData, forKey: searchDataKey)
    defaults.synchronize()

    completion()
  }

}
