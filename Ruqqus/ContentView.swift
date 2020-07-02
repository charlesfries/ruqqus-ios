//
//  ContentView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NewsView().tabItem {
                Image(systemName: "globe")
                Text("News")
            }
            TrendingView().tabItem {
                Image(systemName: "flame.fill")
                Text("Trending")
            }
            GuildsView().tabItem {
                Image("guild-icon")
                Text("Guilds")
            }
            ExploreView().tabItem {
                Image(systemName: "safari.fill")
                Text("Explore")
            }
        }.accentColor(Color("Purple"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
