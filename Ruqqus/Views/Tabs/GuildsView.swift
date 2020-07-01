//
//  GuildsView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct GuildsView: View {
    
    // data
    let feeds: [Feed] = [
        Feed(name: "Home"),
        Feed(name: "All"),
        Feed(name: "Trending")
    ]
    let guilds: [Guild] = [
        Guild(name: "spacex"),
        Guild(name: "WatchRedditDie"),
        Guild(name: "DankMemes"),
        Guild(name: "Apple"),
        Guild(name: "Videos"),
        Guild(name: "News"),
        Guild(name: "Technology"),
        Guild(name: "videos"),
        Guild(name: "Programming"),
        Guild(name: "Politics")
    ]
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Feeds")) {
                    ForEach(feeds) { feed in
                        NavigationLink(destination: FeedView(feed: feed)) {
                            Text(feed.name)
                        }
                    }
                }
                Section(header: Text("Guilds")) {
                    ForEach(guilds) { guild in
                        NavigationLink(destination: GuildView(guild: guild)) {
                            Text(guild.name)
                        }
                    }
                }
            }
            
            .navigationBarTitle("Guilds", displayMode: .inline)
        }.onAppear(perform: fetch)
        
    }
    
    private func fetch() {
        let json = """
        [
            {
                "id": "1",
                "name": "spacex"
            },
            {
                "id": "2",
                "name": "WatchRedditDie"
            }
        ]
        """
        
        do {
            let people = try JSONDecoder().decode([Guild].self, from: Data(json.utf8))
            print(people)
        } catch {
            print(error)
        }
    }
}
