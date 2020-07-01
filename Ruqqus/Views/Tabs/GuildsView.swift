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
    
    var body: some View {
        NavigationView {
            
            if fetch.loading {
                ProgressView()
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

class FetchGuilds: ObservableObject {
    @Published var guilds = [Guild]()
    @Published var loading = false
     
    init() {
        self.loading = true
        
        // TODO:
        let json = """
        [
            { "id": "1", "name": "spacex" },
            { "id": "2", "name": "WatchRedditDie" },
            { "id": "3", "name": "DankMemes" },
            { "id": "4", "name": "Apple" },
            { "id": "5", "name": "Videos" },
            { "id": "6", "name": "News" },
            { "id": "7", "name": "Technology" },
            { "id": "8", "name": "videos" },
            { "id": "9", "name": "Programming" },
            { "id": "10", "name": "Politics" }
        ]
        """
        
        do {
            let decodedData = try JSONDecoder().decode([Guild].self, from: Data(json.utf8))
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // TODO:
                self.guilds = decodedData
                self.loading = false
            }
        } catch {
            print(error)
        }
    }
}
