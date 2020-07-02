//
//  GuildsView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct GuildsView: View {
    
    let feeds: [Feed] = [
        Feed(name: "Home"),
        Feed(name: "All"),
        Feed(name: "Trending")
    ]
    
    @ObservedObject var fetch = FetchGuilds()
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            
            if fetch.loading {
                ActivityIndicator(startAnimating: self.$isLoading)
            }
            
            List {
                Section(header: Text("Feeds")) {
                    ForEach(feeds) { feed in
                        NavigationLink(destination: FeedView(feed: feed)) {
                            Text(feed.name)
                        }
                    }
                }
                Section(header: Text("Guilds")) {
                    ForEach(fetch.guilds) { guild in
                        NavigationLink(destination: GuildView(id: guild.id)) {
                            Text(guild.name)
                        }
                    }
                }
            }
            
            .navigationBarTitle("Guilds", displayMode: .inline)
        }
        
    }
}


