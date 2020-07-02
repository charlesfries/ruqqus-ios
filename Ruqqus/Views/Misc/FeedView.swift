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
    }
}
