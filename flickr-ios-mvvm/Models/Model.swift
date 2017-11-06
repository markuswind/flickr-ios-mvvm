//
//  Model.swift
//  flick-ios-mvvm
//
//  Created by Markus Wind on 06/11/2017.
//  Copyright © 2017 Markus Wind. All rights reserved.
//

import SwiftyJSON

protocol Model {

  init?(values: JSON)

}
