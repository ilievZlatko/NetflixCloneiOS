//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by Zlatko Iliev on 27/11/2020.
//

import SwiftUI

struct CustomTabSwitcher: View {

    @State private var currentTab: CustomTab = .episodes

    var tabs: [CustomTab]

    func tabWidth(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }

    var body: some View {
        VStack {
            // Custom Tab Picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: tabWidth(tab), height: 4)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)

                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: tabWidth(tab), height: 30)
                        }.animation(.easeInOut)
                    }
                }
            }

            Text(currentTab.rawValue)
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
    }
}
