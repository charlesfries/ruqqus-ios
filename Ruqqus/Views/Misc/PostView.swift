//
//  PostView.swift
//  Ruqqus
//
//  Created by Charles Fries on 6/21/20.
//  Copyright © 2020 Charles Fries. All rights reserved.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    @State var showingNewComment = false
    
    // data
    let comments: [Comment] = [
        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #1"),
        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #2"),
        Comment(post: Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg",title: "Post title #1", content: "Here is the content"), user: User(username: "charles"), createdAt: "1d", score: 3, content: "Test comment #3")
    ]
    
    var body: some View {
        
        
        
        VStack(alignment: .leading) {
            Text(post.title)
                .padding(.horizontal)
                .font(.title)
            Text(post.content)
                .padding(.horizontal)
            
            
            
//            Text("in \(post.guild.name) by \(post.user.username)")
//                .padding(.horizontal)
            
            HStack {
                Text("in")
                Button(action: {}) {
                    Text(post.guild.name)
                }
                Text("by")
                Button(action: {}) {
                    Text(post.user.username)
                }
            }.padding(.horizontal)
            
            // context
            HStack {
                Image(systemName: "arrow.up")
                Text(String(post.score))
                Image(systemName: "message")
                Text(String(post.comments))
                Image(systemName: "clock")
                Text(post.createdAt)
            }.padding(.horizontal)
            
            Divider()
            
            // actions
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.up")
                        .font(.title)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "arrow.down")
                        .font(.title)
                }
                Spacer()
                Button(action: {
                    self.showingNewComment.toggle()
                }) {
                    Image(systemName: "arrowshape.turn.up.left")
                        .font(.title)
                }.sheet(isPresented: $showingNewComment) {
                    NewCommentView()
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                }
            }.padding()
            
            Divider()
            
            // comments
            List(comments) { comment in
                CommentRow(comment: comment)
            }
        }
        
        .navigationBarItems(trailing:
            HStack {
                Button(action: {}) {
                    Image("ellipsis")
                }

                Button("What") {
                    
                }
            }
        )
    }
}



struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(guild: Guild(name: "test"), user: User(username: "charles"), score: 0, comments: 0, createdAt: "abc", previewURL: "https://b.thumbs.redditmedia.com/lmq9dOfhl7kVOkhETO3V4S8M0Ypuo9UORJ4dKTe5H_Y.jpg", title: "Post title #1", content: "Here is the content")
        return PostView(post: post)
    }
}
