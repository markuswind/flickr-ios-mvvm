//
//  PhotoCollectionViewModel.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

class PhotoCollectionViewModel {

    let reuseIdentifier = "PhotoCollectionViewCell"

    // TODO: - make these variables static?
    static let itemsPerPage = 30
    static let itemsPerRow = 2
    static let itemsPerSection = 10
    static let itemsTreshold = itemsPerPage / 2

    let photosSearchTerm: String!

    var photosData: [Photo] = []
    var currentPage = 0
    var totalPages = 0

    init(searchTerm: String) {
        photosSearchTerm = searchTerm
    }

}
