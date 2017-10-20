//
//  SearchViewModel.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import Foundation

class SearchViewModel {

    let reuseIdentifier = "SearchViewCell"
    let searchDataKey = "SearchDataKey"
    
    var searchData: [String] = []

    func retrieveInitialSearchData() {
        if let data: Any = UserDefaults.standard.object(forKey: searchDataKey) {
            searchData = data as! [String]
        }
    }

    private func saveSearch(text: String) {
        // FIXME: - should not be case sensitive
        let uniqueSearchData = searchData.filter { $0 != text }

        searchData = uniqueSearchData
        searchData.insert(text, at: 0)

        let defaults = UserDefaults.standard
        defaults.set(searchData, forKey: searchDataKey)
        defaults.synchronize()
    }

}
