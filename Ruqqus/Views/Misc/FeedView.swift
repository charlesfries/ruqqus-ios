//
//  FeedView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    var feed: Feed
    
    @ObservedObject var fetch = FetchPosts()
    @State var showSort = false
    
    var body: some View {
        VStack {
            
            if fetch.loading {
                ActivityIndicator(startAnimating: $fetch.loading)
            }
            
            List(fetch.posts) { post in
                FeedPostRow(post: post)
            }
        }
        .navigationBarTitle(feed.name)
        
        .navigationBarItems(trailing:
            Button(action: {
                self.showSort = true
            }) {
                Image(systemName: "arrow.up.arrow.down")
            }
        )
        
        .actionSheet(isPresented: $showSort) {
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
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(feed: Feed(name: "Home"))
    }
}
