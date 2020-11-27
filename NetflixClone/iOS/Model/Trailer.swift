//
//  Trailer.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 27/11/2020.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
