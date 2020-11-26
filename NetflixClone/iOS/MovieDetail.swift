//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 26/11/2020.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie

    let screen = UIScreen.main.bounds

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Spacer()

                    Button(action: {
                        // close this window
                    }, label: {
                        ZStack(alignment: .center) {
                            Circle().fill(Color.white).opacity(0.2).frame(width: 28, height: 28)
                            Image(systemName: "xmark")
                                .font(.system(size: 16))
                        }
                    })

                }
                .padding(.horizontal, 22)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)

                        MovieInfoSubheadline(movie: movie)

                        if movie.promotionHeadline != nil {
                            Text(movie.promotionHeadline!)
                                .bold()
                                .font(.headline)
                        }

                        PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                            //
                        }
                    }
                    .padding(.horizontal, 10)
                }

                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: exampleMovie2)
    }
}

struct MovieInfoSubheadline: View {
    var movie: Movie

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)

            Text(String(movie.year))

            RatingView(rating: movie.rating)

            Text(movie.numberOfSeasonsDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.5)

            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}
