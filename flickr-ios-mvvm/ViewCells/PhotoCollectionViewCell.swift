//
//  PhotoCollectionViewCell.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

  let imageView: UIImageView = {
    let imageView = UIImageView()

    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = true

    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    imageView.frame = contentView.frame
    contentView.addSubview(imageView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

