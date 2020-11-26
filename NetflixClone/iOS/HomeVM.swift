//
//  HomeVM.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 26/11/2020.
//

import Foundation

class HomeVM: ObservableObject {
    // String == Category
    @Published var movies: [String: [Movie]] = [:]

    public var allCategories: [String] {
        return movies.keys.map({ String($0) })
    }

    public func getMovie(forCat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }

    init() {
        setupMovies()
    }

    func setupMovies() {
        movies["Trending Now"] = exampleMovies.shuffled()
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Releases"] = exampleMovies.shuffled()
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
    }
}
