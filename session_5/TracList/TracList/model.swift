//
//  model.swift
//  TracList
//
//  Created by Berenice Medel on 28/02/20.
//  Copyright © 2020 Berenice Medel. All rights reserved.
//

import UIKit

struct ResultsSearch: Codable{
    var resultCount: Int
    var results:[Track]
}


struct Track:   Codable{
    var artistName: String
    var trackName: String
    var artworkUrl100: String
    
}
