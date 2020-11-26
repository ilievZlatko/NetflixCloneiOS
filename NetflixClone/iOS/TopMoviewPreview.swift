//
//  TopMoviewPreview.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 26/11/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviewPreview: View {
    var movie: Movie

    func isCategoryLast(_ cat: String) -> Bool {
        let catCount = movie.categories.count

        if let index = movie.categories.firstIndex(of: cat) {
            if index + 1 != catCount {
                return false
            }
        }

        return true
    }

    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()

            VStack {
                Spacer()

                HStack {
                    ForEach(movie.categories, id: \.self) { category in

                        HStack {
                            Text(category)
                                .font(.footnote)

                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                .padding(.bottom, 5)

                HStack {
                    Spacer()

                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        // Place action here
                    }

                    Spacer()

                    WhiteButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)

                    Spacer()

                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        // Details screen
                    }

                    Spacer()
                }
            }
            .background(
                LinearGradient.blackOpacityGradient
                    .padding(.top, 250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviewPreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviewPreview(movie: exampleMovie2)
    }
}
