//
//  Model.swift
//  ProyFirebase
//
//  Created by Berenice Medel on 13/03/20.
//  Copyright © 2020 galios. All rights reserved.
//

import UIKit

struct Photo: Codable{
    var id: String
    var secret: String
    var server: String
    var farm: Int
}

struct ResultPhotos: Codable{
    var page: Int
    var total: String
    var photo: [Photo]
}


struct ResultSearch: Codable{
    var photos: ResultPhotos
}
