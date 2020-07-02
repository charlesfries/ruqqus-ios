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
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)
                
                VStack(alignment: .leading) {
                    Text(post.title)
                    HStack {
                        Button(action: {}) {
                            Text("+\(post.guild)")
                                .foregroundColor(Color("Purple"))
                        }
                        Image(systemName: "arrow.up")
                        Text(String(post.score))
                        Image(systemName: "message")
                        Text(String(post.comments))
                        Image(systemName: "clock")
                        Text(post.createdAt)
                        Image(systemName: "ellipsis")
                    }.foregroundColor(Color("Grey")).padding(0)
                }
            }
        }.padding(.vertical, 5)
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
                            Text(post.user)
                                .foregroundColor(Color("Purple"))
                        }
                        Image(systemName: "arrow.up")
                        Text(String(post.score))
                        Image(systemName: "message")
                        Text(String(post.comments))
                        Image(systemName: "clock")
                        Text(post.createdAt)
                    }.foregroundColor(Color("Grey"))
                }
            }
        }
    }
}

struct CommentRow: View {
    var comment: Comment
    @State private var action: Int? = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: { self.action = 1 }) {
                    Text(comment.user).foregroundColor(Color("Purple"))
                }
                
                Image(systemName: "arrow.up").foregroundColor(Color("Grey"))
                Text(String(comment.score)).foregroundColor(Color("Grey"))
                Spacer()
                Text(comment.createdAt).foregroundColor(Color("Grey"))
            }
            Text(comment.content)
            
            NavigationLink(destination: UserView(id: comment.user), tag: 1, selection: $action) {
                EmptyView()
            }
        }
    }
    
}

struct RowViews_Previews: PreviewProvider {
    static var previews: some View {
        FeedPostRow(post: Post(guild: "spacex", user: "charles", score: 0, comments: 0, createdAt: "1d", previewURL: "", title: "The Title", content: "The Content"))
//        CommentRow(comment: Comment(post: "123", user: "charles", createdAt: "1d", score: 0, content: "Hello, world!"))
    }
}
