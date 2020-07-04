//
//  GuildView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct GuildView: View {
    var guild: String
    
    @ObservedObject var fetch = FetchPosts()
    @State var showingSort = false
    @State var showingInfo = false
    
    var body: some View {
        VStack {
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            
            List(fetch.posts) { post in
                PostRow(isFeed: false, post: post)
            }
        }
        .navigationBarTitle(guild)
        .navigationBarItems(trailing:
            HStack {
                
                // sort
                Button(action: { self.showingSort = true }) {
                    Image(systemName: "arrow.up.arrow.down")
                }
                
                .actionSheet(isPresented: $showingSort) {
                    ActionSheet(title: Text("Sort By"), buttons: [
                        .default(Text("Best")),
                        .default(Text("Hot")),
                        .default(Text("Top")),
                        .default(Text("New")),
                        .default(Text("Rising")),
                        .default(Text("Controversial")),
                        .cancel()
                    ])
                }
                
                // info
                Button(action: { self.showingInfo = true }) {
                    Image(systemName: "ellipsis")
                }
                .actionSheet(isPresented: $showingInfo) {
                    ActionSheet(title: Text("Info"), buttons: [
                        .default(Text("Submit Post")),
                        .default(Text("Subscribe")),
                        .default(Text("Share")),
                        .cancel()
                    ])
                }
            }
        )
    }
}
