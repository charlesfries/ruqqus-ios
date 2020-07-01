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
    
    // data
    let posts: [Post] = [
//        Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "1d", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"),
//        Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "1d", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #2", content: "Here is the content"),
//        Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "1d", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #3", content: "Here is the content")
    ]
    
    var body: some View {
//        ProgressView()
        List(posts) { post in
            FeedPostRow(post: post)
        }
        .navigationBarTitle(feed.name)
    }
}
