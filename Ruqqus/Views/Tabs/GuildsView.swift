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
    
    var favoritedGuilds: [Guild] {
        return fetch.guilds.filter { ($0.isFavorited ?? false) }
    }
    
    var body: some View {
        NavigationView {
            
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            
            List {
                Section(header: Text("Feeds")) {
                    ForEach(feeds) { feed in
                        NavigationLink(destination: FeedView(feed: feed)) {
                            Text(feed.name)
                        }
                    }
                }
                Section(header: Text("Favorites")) {
                    ForEach(favoritedGuilds) { guild in
                        ZStack {
                            HStack {
                                Text(guild.name)
                                Spacer()
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("Purple"))
                            }
                            NavigationLink(destination: GuildView(guild: guild.name)) {}
                        }
                    }
                }
                Section(header: Text("Guilds")) {
                    ForEach(fetch.guilds) { guild in
                        ZStack {
                            HStack {
                                Text(guild.name)
                                Spacer()
                                Button(action: { /*guild.isFavorited?.toggle()*/ }) {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("LightGrey"))
                                }
                                
                            }
                            NavigationLink(destination: GuildView(guild: guild.name)) {}
                        }
                    }
                }
            }
            
            .navigationBarTitle("Guilds", displayMode: .inline)
        }
        
    }
}

struct GuildsView_Previews: PreviewProvider {
    static var previews: some View {
        GuildsView()
    }
}
