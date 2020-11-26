//
//  Movie.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 26/11/2020.
//

import Foundation

struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    var categories: [String]
}
