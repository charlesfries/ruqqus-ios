//
//  RowViews.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct FeedPostRow: View {
    var post: Post

    var body: some View {
        NavigationLink(destination: PostView(post: post)) {
            HStack(alignment: .top) {
                Image("PostPreview")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(post.title)
                    HStack {
                        Button(action: {}) {
                            Text(post.guild.name)
                        }
                        Image(systemName: "arrow.up")
                        Text(String(post.score))
                        Image(systemName: "message")
                        Text(String(post.comments))
                        Image(systemName: "clock")
                        Text(post.createdAt)
                    }
                }
            }
        }
    }
}

struct GuildPostRow: View {
    var post: Post

    var body: some View {
        NavigationLink(destination: PostView(post: post)) {
            HStack(alignment: .top) {
                Image("PostPreview")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(post.title)
                    HStack {
                        Button(action: {}) {
                            Text(post.user.username)
                        }
                        Image(systemName: "arrow.up")
                        Text(String(post.score))
                        Image(systemName: "message")
                        Text(String(post.comments))
                        Image(systemName: "clock")
                        Text(post.createdAt)
                    }
                }
            }
        }
    }
}

struct CommentRow: View {
    var comment: Comment
    
    var body: some View {
        NavigationLink(destination: UserView(user: comment.user)) {
            VStack(alignment: .leading) {
                HStack {
                    Text(comment.user.username)
                    Image(systemName: "arrow.up")
                    Text(String(comment.score))
                    Image(systemName: "clock")
                    Text(comment.createdAt)
                }
                Text(comment.content)
            }
        }
    }
    
}