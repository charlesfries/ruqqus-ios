//
//  AccountView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
//            Text("Account")
//            .navigationBarTitle("Account", displayMode: .inline)
            
            List {
                HStack {
                    VStack {
                        Text("7.3k").font(.title)
                        Text("Rep")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("57").font(.title)
                        Text("Subscribers")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    Spacer()
                    VStack {
                        Text("11m 25d").font(.title)
                        Text("Account Age")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                }.padding()
//                Section(header: Text("Feeds")) {
//                    ForEach(feeds) { feed in
//                        NavigationLink(destination: FeedView(feed: feed)) {
//                            Text(feed.name)
//                        }
//                    }
//                }
//                Section(header: Text("Guilds")) {
//                    ForEach(fetch.guilds) { guild in
//                        NavigationLink(destination: GuildView(id: guild.id)) {
//                            Text(guild.name)
//                        }
//                    }
//                }
            }.listStyle(GroupedListStyle())
            
            .navigationBarTitle("captainmeta4", displayMode: .inline)
        }
    }
}
