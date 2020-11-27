//
//  TrailerList.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 27/11/2020.
//

import SwiftUI

struct TrailerList: View {

    var trailers: [Trailer]
    let screen = UIScreen.main.bounds

    var body: some View {
        VStack {
            ForEach(trailers) { trailer in

                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailImageURL, videoURL: trailer.videoURL)
                        .frame(maxWidth: screen.width)

                    Text(trailer.name)
                        .font(.headline)
                }
                .foregroundColor(.white)
                .padding(.bottom, 20)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            TrailerList(trailers: exampleTrailers)
        }
    }
}
