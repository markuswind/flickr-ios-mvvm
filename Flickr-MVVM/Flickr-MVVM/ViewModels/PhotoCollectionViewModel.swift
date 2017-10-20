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
    let itemsPerPage = 30
    let itemsPerRow = 2
    let itemsPerSection = 10
    let itemsTreshold = 15

    var photosData: [Photo] = []

}
