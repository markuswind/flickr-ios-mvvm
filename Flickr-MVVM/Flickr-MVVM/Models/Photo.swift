//
//  Photo.swift
//  Flickr-MVVM
//
//  Created by Markus Wind on 20/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

class Photo {
    private let farm: Int
    private let server: Int
    private let id: Int
    private let secret: String
    private let title: String

    init(farm: Int, server: Int, id: Int, secret: String, title: String) {
        self.farm = farm
        self.server = server
        self.id = id
        self.secret = secret
        self.title = title
    }
}

extension Photo {
    func url() -> String {
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
}
