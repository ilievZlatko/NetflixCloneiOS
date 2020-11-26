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

    // MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?

    // Personalization
    
    var episodes: [Episode]?
    var promotionHeadline: String?

    var numberOfSeasonsDisplay: String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 season"
            } else {
                return "\(num) seasos"
            }
        }

        return ""
    }
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    var episodeName: String
    var description: String
    var season: Int
    var episode: Int
}
