//
//  SearchViewCell.swift
//  flickr-ios-mvvm
//
//  Created by Markus Wind on 21/10/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
